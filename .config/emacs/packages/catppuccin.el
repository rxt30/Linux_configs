(unless (package-installed-p 'catppuccin-theme)
  (package-install 'catppuccin-theme))
(load-theme 'catppuccin :no-confirm)
