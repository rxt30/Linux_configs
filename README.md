# Linux_configs
Welcome to my Linux configuration files.    
It's a collection of various configuration files, with different WMs, editors and terminals.    

In this README, the needed dependencies and some information are described for:
- awesome (window manager)
- neovim (text editor)
- fish (shell)
, as these are my main tools.
All requirements are mainly to their according Arch Linux/AUR-Package
The above listed are all styled according to the theme [`catppuccin`](https://github.com/catppuccin/catppuccin).
<!--Configs for kitty and neofetch are taken from [Dragonsight91 dotfiles](https://github.com/Dragonsight91/dotfiles)--->

## awesome
### Dependencies
- `awesome-git`
  - Will be locked to `4.4` if it's released
- `lxqt`
  - It's better to install the whole DE, as several daemons are used, and the menus provide quite a nice interface
- `kitty`
- `chromium`
- `xsecurelock`
- `xss-lock`
- `rofi`
- `nm-applet`
- `pasystray`
- `disman-kwinft`
- `kdisplay-kwinft`

If any of the above listed daemons/programms should be not used, they can be removed or changed at [`.config/awesome/configuration/apps.lua`](https://github.com/rxt30/Linux_configs/blob/master/.config/awesome/configuration/apps.lua) and [`.config/awesome/configuration/autorun.lua`](https://github.com/rxt30/Linux_configs/blob/master/.config/awesome/configuration/autorun.lua).    
The system wide key mapping can be found in [`.config/awesome/configuration/keys/global.lua`](https://github.com/rxt30/Linux_configs/blob/master/.config/awesome/configuration/keys/global.lua), the client specific configuration in [`.config/awesome/configuration/client/keys.lua`](https://github.com/rxt30/Linux_configs/blob/master/.config/awesome/configuration/client/keys.lua).

## neovim
### Dependencies
- [`packer.nvim`](https://github.com/wbthomason/packer.nvim)

### Usage
To install all plugins, just call `nvim +PackerSync`.    
The list of all plugins can be found at [`.config/nvim/lua/plugins/plugins.lua`](https://github.com/rxt30/Linux_configs/blob/master/.config/nvim/lua/plugins/plugins.lua).

#### Autocomplete and LSP
Autocomplete is automatically enabled with [`coq_nvim`](https://github.com/ms-jpq/coq_nvim).     
It is powered by [`nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) and [`nvim-lsp-installer`](https://github.com/williamboman/nvim-lsp-installer).    
New LSPs can be installed by opening a file with the according file type and execute the command `:LspInstall`.

#### Running the currently open file
The content of specific currently open file can be run by pressing `F5`.    
The plugin and the list of compatible files can be found at [`sniprun`](https://github.com/michaelb/sniprun)

## fish
`fish` is the default shell used by me.     
### Aliases
All these aliases are only used, if command is aviable.   
- `nvim` mapped `vim`
- `exa -l` mapped `ls -l`
