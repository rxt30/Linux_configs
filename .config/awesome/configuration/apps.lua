local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. "utilities/"
local terminal = "kitty"

return {
  --- Default Applications
  default = {
    --- Default terminal emulator
    terminal = terminal,
    --- Default music client
    music_player = "wezterm start --class music ncmpcpp",
    --- Default text editor
    text_editor = "wezterm start nvim",
    --- Default code editor
    code_editor = "code",
    --- Default web browser
    web_browser = "firefox",
    --- Default file manager
    file_manager = "nautilus",
    --- Default network manager
    network_manager = terminal .. " nmtui",
    --- Default bluetooth manager
    bluetooth_manager = "blueman-manager",
    --- Default power manager
    power_manager = "xfce4-power-manager",
    --- Default audio manager
    audio_manager = "pavucontrol",
    --- Default rofi global menu
    app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme " .. config_dir .. "configuration/rofi.rasi",
    --- Default lock screen application
    lock = "xset s activate",
  },

  --- List of binaries/shell scripts that will execute for a certain task
  utils = {
    --- Fullscreen screenshot
    full_screenshot = utils_dir .. "screensht full",
    --- Area screenshot
    area_screenshot = utils_dir .. "screensht area",
    --- Color Picker
    color_picker = utils_dir .. "xcolor-pick",
  },
}
