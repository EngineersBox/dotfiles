from datetime import datetime, timezone
from pathlib import Path
import configparser

from kitty.fast_data_types import Screen, add_timer
from kitty.rgb import Color
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    Formatter,
    TabBarData,
    as_rgb,
    draw_attributed_string,
    draw_title,
    get_boss
)
from kitty.utils import (
    color_as_int,
    log_error
)

timer_id = None

ICON = "  "
RIGHT_MARGIN = 1
REFRESH_TIME = 15

icon_fg = as_rgb(color_as_int(Color(255, 250, 205)))
icon_bg = as_rgb(color_as_int(Color(47, 61, 68)))
# OR icon_bg = as_rgb(0x2f3d44)
bat_text_color = as_rgb(0x999F93)
clock_color = as_rgb(0x7FBBB3)
dnd_color = as_rgb(0x465258)
sep_color = as_rgb(0x999F93)
utc_color = as_rgb(color_as_int(Color(113, 115, 116)))

def calc_draw_spaces(*args) -> int:
    length = 0
    for i in args:
        if not isinstance(i, str):
            i = str(i)
        length += len(i)
    return length

def _draw_icon(screen: Screen, index: int) -> int:
    if index != 1:
        return 0
    fg, bg = screen.cursor.fg, screen.cursor.bg
    screen.cursor.fg = icon_fg
    screen.cursor.bg = icon_bg
    screen.draw(ICON)
    screen.cursor.fg, screen.cursor.bg = fg, bg
    screen.cursor.x = len(ICON)
    return screen.cursor.x

def search_upwards_for_file(directory: Path, filename: str) -> Path | None:
    root = Path(directory.root)
    while directory != root:
        attempt = directory / filename
        if attempt.exists() and attempt.is_file():
            return attempt
        directory = directory.parent
    return None

def retrieve_current_path(cwd: str) -> str:
        cwd_path = Path(cwd)
        if cwd_path == Path.home():
            return "~"
        try:
            return f"~/{str(Path(cwd).relative_to(Path.home()))}"
        except ValueError:
            return cwd

def infer_tab_name(tab: TabBarData) -> str:
    tab_manager = get_boss().active_tab_manager
    if tab_manager is None:
        return tab.title
    current_tab = tab_manager.tab_for_id(tab.tab_id)
    if  current_tab is None:
        return tab.title
    window = current_tab.active_window
    if window is None:
        return tab.title
    cwd = window.cwd_of_child
    if cwd is None:
        return tab.title
    tabconf_path = search_upwards_for_file(Path(cwd), ".tabconf")
    if tabconf_path is None:
        title = retrieve_current_path(cwd)
        return title
    tabconf = configparser.ConfigParser()
    tabconf.read(tabconf_path)
    if not tabconf.has_section("Tab"):
        title = retrieve_current_path(cwd)
        return title
    check_path = cwd + "/.tabconf"
    if str(tabconf_path) != check_path and not tabconf.getboolean("Tab", "apply_nested", fallback=True):
        title = retrieve_current_path(cwd)
        return title
    title = tabconf.get("Tab", "title", fallback=None)
    if title is None:
        title = retrieve_current_path(cwd)
        return title
    return title

def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    if draw_data.leading_spaces:
        screen.draw(" " * draw_data.leading_spaces)
    tab = tab._replace(title=infer_tab_name(tab))
    draw_title(draw_data, screen, tab, index)
    trailing_spaces = min(max_title_length - 1, draw_data.trailing_spaces)
    max_title_length -= trailing_spaces
    extra = screen.cursor.x - before - max_title_length
    if extra > 0:
        screen.cursor.x -= extra + 1
        screen.draw("…")
    if trailing_spaces:
        screen.draw(" " * trailing_spaces)
    end = screen.cursor.x
    screen.cursor.bold = screen.cursor.italic = False
    screen.cursor.fg = 0
    if not is_last:
        screen.cursor.bg = as_rgb(color_as_int(draw_data.inactive_bg))
        screen.draw(draw_data.sep)
    screen.cursor.bg = 0
    return end

# more handy kitty tab_bar things:
# REF: https://github.com/kovidgoyal/kitty/discussions/4447#discussioncomment-2183440
def _draw_right_status(screen: Screen, is_last: bool) -> int:
    if not is_last:
        return 0
    draw_attributed_string(Formatter.reset, screen)
    clock = datetime.now().strftime("%H:%M")
    utc = datetime.now(timezone.utc).strftime(" (UTC %H:%M)")
    cells = []
    cells.append((clock_color, clock))
    cells.append((utc_color, utc))
    # right_status_length = calc_draw_spaces(dnd + " " + clock + " " + utc)
    right_status_length = RIGHT_MARGIN
    for cell in cells:
        right_status_length += len(str(cell[1]))
    draw_spaces = screen.columns - screen.cursor.x - right_status_length
    if draw_spaces > 0:
        screen.draw(" " * draw_spaces)
    screen.cursor.fg = 0
    for color, status in cells:
        screen.cursor.fg = color  # as_rgb(color_as_int(color))
        screen.draw(status)
    screen.cursor.bg = 0
    if screen.columns - screen.cursor.x > right_status_length:
        screen.cursor.x = screen.columns - right_status_length
    return screen.cursor.x

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    # _draw_icon(screen, index)
    _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data,
    )
    # _draw_right_status(
    #     screen,
    #     is_last,
    # )
    return screen.cursor.x
