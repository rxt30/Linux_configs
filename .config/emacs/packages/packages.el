(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; Auto-completion
(unless (package-installed-p 'company)
  (package-install 'company))
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") #'company-select-next-if-tooltip-visible-or-complete-selection)
     (define-key company-active-map [tab] #'company-select-next-if-tooltip-visible-or-complete-selection)
     (define-key company-active-map (kbd "BACKTAB") #'company-select-previous-or-abort)
     (define-key company-active-map [backtab] #'company-select-previous-or-abort)))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)

;; LSP
(unless (package-installed-p 'lsp-mode)
  (package-install 'lsp-mode))
;; LSP UI
(unless (package-installed-p 'lsp-ui)
  (package-install 'lsp-ui))

;; Python
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
			 (require 'lsp-pyright)
			 (lsp))))

;; Catppuccin
(unless (package-installed-p 'catppuccin-theme)
  (package-install 'catppuccin-theme))
(load-theme 'catppuccin :no-confirm)
