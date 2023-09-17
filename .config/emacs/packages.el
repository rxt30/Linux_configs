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

;;Rainbow brackets
(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Smart parens
(unless (package-installed-p 'smartparens)
  (package-install 'smartparens))
(require 'smartparens-config)
(add-hook 'prog-mode-hook #'smartparens-mode)

;; Shell pop
(unless (package-installed-p 'shell-pop)
  (package-install 'shell-pop))
(require 'shell-pop)
(global-set-key [f12] 'shell-pop)

;; Neotree
(unless (package-installed-p 'neotree)
  (package-install 'neotree))
(require 'neotree)
(define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
