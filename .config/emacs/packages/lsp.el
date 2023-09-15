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
