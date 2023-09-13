(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(load-file "~/.config/emacs/packages/evil.el")
(load-file "~/.config/emacs/packages/auto-completion.el")
(load-file "~/.config/emacs/packages/lsp.el")
(load-file "~/.config/emacs/packages/catppuccin.el")
(load-file "~/.config/emacs/packages/format-all.el")
(load-file "~/.config/emacs/packages/indent.el")

;; All the icons
(unless (package-installed-p 'all-the-icons)
  (package-install 'all-the-icons))
(when (display-graphic-p)
  (require 'all-the-icons))
