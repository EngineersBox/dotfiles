# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git k)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# ---- RUST ----

fpath+=~/.zfunc
source "$HOME/.cargo/env"

# ---- CUSTOM CONFIGS ----

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=$HOME/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;source $HOME/Desktop/Work/Second-Year/COMP2310/testing/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh

# ---- PATH ENV VAR ---- #
export PATH="/usr/local/sbin:/Applications/CMake.app/Contents/bin:/usr/local/code:$HOME/.autojump/bin:$HOME/opt/GNAT/2019/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin"

CMAKE_OSX_SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---- FUNCTIONS ---- #

function git_cp() {
    git add .
    git commit -m "$1"
    git push
}

function leak_test() {
    md ./memory_analysis
    leaks --hex --atExit -- $1 | grep LEAK:
}

function leak_test_log() {
    md ./memory_analysis
    leaks --hex --outputGraph="./memory_analysis/$(date +"%Y-%m-%d_%H-%M-%S")" --atExit -- $1
}

function init_qemu() {
  cd $1
  qemu-system-x86_64 -drive file=$HOME/linux_distros/ubuntu.raw,format=raw,index=0,media=disk \
    -drive media=cdrom,file=$HOME/linux_distros/ubuntu-20.04.4-live-server-amd64.iso,readonly=on \
    -boot d \
    -m 4G,slots=4,maxmem=32G \
    -smp 4 \
    -machine pc,nvdimm=on \
    -object memory-backend-file,id=mem1,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm0,size=4G \
    -device nvdimm,memdev=mem1,id=nv1,label-size=2M \
    -object memory-backend-file,id=mem2,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm1,size=4G \
    -device nvdimm,memdev=mem2,id=nv2,label-size=2M \
    -virtfs local,path=$1,security_model=none,mount_tag=$2
}

function start_qemu() {
  echo "Mount the FS into the VM with: 'sudo mount -t 9p -o trans=\"virtio $2 $1\" -oversion=9p2000.u'"
  cd $1
  qemu-system-x86_64 -drive file=$HOME/linux_distros/ubuntu.raw,format=raw,index=0,media=disk \
    -boot d \
    -m 4G,slots=4,maxmem=32G \
    -smp 4 \
    -machine pc,nvdimm=on \
    -object memory-backend-file,id=mem1,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm0,size=4G \
    -device nvdimm,memdev=mem1,id=nv1,label-size=2M \
    -object memory-backend-file,id=mem2,share=on,mem-path=$HOME/linux_distros/vms/qemu/f27nvdimm1,size=4G \
    -device nvdimm,memdev=mem2,id=nv2,label-size=2M \
    -virtfs local,path=$1,security_model=none,mount_tag=$3
}

function showPreview() {
  gitFilePreview="git diff $@ --color=always -- {-1} | delta --line-numbers --dark"
  execute="enter:execute(git difftool {} < /dev/tty)"
  git diff $@ --name-only | fzf -m --ansi --bind $execute --preview-window=wrap --preview "$gitFilePreview"
}

function fzd() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    if [ -d .git ]; then
      showPreview > /dev/null
    else
      gitRepoDir=$(git rev-parse --git-dir | sed 's/.git//')
      pushd $gitRepoDir > /dev/null
      showPreview > /dev/null
      popd > /dev/null
    fi
  else
    echo "Error: Not inside a git repository."
  fi
}

function nnn-preview () {
    # Block nesting of nnn in subshells
    if [ -n "$NNNLVL" ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to see.
    # To cd on quit only on ^G, remove the "export" and set NNN_TMPFILE *exactly* as this:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # This will create a fifo where all nnn selections will be written to
    NNN_FIFO="$(mktemp --suffix=-nnn -u)"
    export NNN_FIFO
    (umask 077; mkfifo "$NNN_FIFO")

    # Preview command
    preview_cmd="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/plugins/preview-tui"

    # Use `tmux` split as preview
    if [ -e "${TMUX%%,*}" ]; then
        tmux split-window -e "NNN_FIFO=$NNN_FIFO" -dh "$preview_cmd"

    # Use `xterm` as a preview window
    elif (which xterm &> /dev/null); then
        xterm -e "$preview_cmd" &

    # Unable to find a program to use as a preview window
    else
        echo "unable to open preview, please install tmux or xterm"
    fi

    nnn "$@"

    rm -f "$NNN_FIFO"
}

# ---- SKETCHYBAR ---- #

# Sketchybar interactivity overloads
function brew() {
  command brew "$@"

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}

# Fancy sketchybar commands
function margin() {
  if [ $1 = "on" ]; then
    yabai -m config top_padding 20
    sketchybar --animate sin 30 --bar margin=10 y_offset=10 corner_radius=9
  else
    yabai -m config top_padding 10
    sketchybar --animate sin 30 --bar margin=0 y_offset=0 corner_radius=0
  fi
}

function zen() {
  ~/.config/sketchybar/plugins/zen.sh $1
}

# ---- ALIASES ---- #

alias ka="k -a"
alias xtr="exa -lxaTR --icons"
alias xr="exa -lxaR --icons"
alias xt="exa -lxaT --icons"
alias xa="exa -lxa --icons"

alias server="python -m SimpleHTTPServer 8000"
alias reload="source ~/.zshrc"
alias myip="curl http://ipecho.net/plain; echo"
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias launch_instruments="open /Applications/Xcode.app/Contents/Applications/Instruments.app"
alias ulist=ultralist
alias tcs="ssh -L 3001:localhost:3001 mike@anu.jkl.io"
alias git_rhh="git reset HEAD --hard"

alias start_vector="brew services start vector"
alias stop_vector="brew services stop vector"

alias start_msq="mosquitto -c /usr/local/etc/mosquitto/mosquitto.conf"
alias ts="ets -f '[%Y-%m-%d %H:%M:%S.%L]'"
alias mvshaders="ditto ~/Desktop/Projects/GLSL/QuantaShader/shaders ~/Library/Application\ Support/minecraft/shaderpacks/QuantaShader/shaders"

alias update_vcpkg="cd $HOME/vcpkg && git pull && cd -"
alias update_overleaf="nativefier --upgrade /Applications/Overleaf.app"

alias clear_intellij_cache="rm -rf ~/Library/Caches/JetBrains/IntelliJIdea*"

alias reload_yabai="launchctl kickstart -k \"gui/${UID}/homebrew.mxcl.yabai\""
alias reload_sketchybar="launchctl kickstart -k \"gui/${UID}/homebrew.mxcl.sketchybar\""
alias reload_skhd="launchctl kickstart -k \"gui/${UID}/homebrew.mxcl.skhd\""

# ---- EXPORT DEFINITIONS ---- #

export WEZTERM_CONFIG_FILE="~/.config/wezterm/wezterm.lua"
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH="$GOPATH/bin:$PATH"
export PATH="$GOROOT/bin:$PATH"
export JAVA_HOME=`/usr/libexec/java_home -v 19.0.2`
export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
export PATH=$PATH:/usr/local/Cellar/rust/1.59.0/bin
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"
export VCPKG_ROOT="$HOME/vcpkg"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/libffi/lib/pkgconfig:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/lib/pkgconfig:/Users/jackkilrain/vcpkg/packages/openmpi_x64-osx/lib/pkgconfig"
export NNN_PLUG="p:preview-tui"
export NNN_FIFO="~/nnn.fifo"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin:/usr/local/opt/openjdk/bin"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=numbers,header,grid --line-range :300 {}'"

# Opam configuration
[[ ! -r $HOME/.opam/opam-init/init.zsh ]] || source $HOME/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

compinit
