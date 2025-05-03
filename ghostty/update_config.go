/*
Example ghostty config snippet:

# displays: {"3": "-13%", "1": "0%"}
adjust-cell-with = "0%"
*/

package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"os"
	"strconv"
	"strings"

	"github.com/andybrewer/mack"
	"github.com/kbinani/screenshot"
)

var (
	cfg = flag.String("fn", "~/.config/ghostty/config", "config file path")
)

func main() {
	flag.Parse()

	// Expand the config file path, subsituting ~ with the home directory
	homeDir, err := os.UserHomeDir()
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error getting home directory: %v\n", err)
		os.Exit(1)
	}
	*cfg = strings.ReplaceAll(*cfg, "~", homeDir)

	conf, err := os.ReadFile(*cfg)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error reading config file: %v\n", err)
		os.Exit(1)
	}
	lines := strings.Split(string(conf), "\n")

	num_displays := strconv.Itoa(screenshot.NumActiveDisplays())
	fmt.Printf("Display count: %s\n", num_displays)

	// Example stanza from the ghostty config file:
	// # displays: {"3": "-13%", "1": "0%"}
	// adjust-cell-with = "0%"

	// Look for the line that starts with the option.
	for i := range len(lines) - 1 {
		if !strings.HasPrefix(lines[i], "# displays: ") {
			continue
		}
		var opts map[string]string
		if err := json.Unmarshal([]byte(lines[i][12:]), &opts); err != nil {
			panic(err)
		}
		if len(opts) == 0 {
			continue
		}
		parts := strings.Split(lines[i+1], "=")
		if len(parts) != 2 {
			continue
		}
		parts[0], parts[1] = strings.TrimSpace(parts[0]), strings.TrimSpace(parts[1])
		opt_value, ok := opts[num_displays]
		if ok {
			lines[i+1] = fmt.Sprintf("%s = %s", parts[0], opt_value)
		}
	}

	// Write the modified config back to the file
	err = os.WriteFile(*cfg, []byte(strings.Join(lines, "\n")), 0o644)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error writing config file: %v\n", err)
		os.Exit(1)
	}

	mack.Tell("System Events",
		`tell process "Ghostty"`,
		`click menu item "Reload Configuration" of menu "Ghostty" of menu bar item "Ghostty" of menu bar 1`,
		`end tell`)
}
