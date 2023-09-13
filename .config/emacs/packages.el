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


(defun select-next-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-select-next-if-tooltip-visible-or-complete-selection)
    (indent-according-to-mode)))

(defun select-previous-or-indent ()
  (interactive)
  (if (company-manual-begin)
      (company-select-previous-or-abort)
    (indent-according-to-mode)))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") #'select-next-or-indent)
     (define-key company-active-map [tab] #'select-next-or-indent)
     (define-key company-active-map (kbd "BACKTAB") #'select-previous-or-indent)
     (define-key company-active-map [backtab] #'select-previous-or-indent)))
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
(unless (package-installed-p 'lsp-mode)
  (package-install 'catppuccin-theme))
(load-theme 'catppuccin :no-confirm)
