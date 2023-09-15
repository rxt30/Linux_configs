;; Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-v") 'split-window-below)
(define-key evil-normal-state-map (kbd "C-x") 'split-window-right)
(define-key evil-normal-state-map (kbd "C-h") 'windmove-left)
(define-key evil-normal-state-map (kbd "C-j") 'windmove-down)
(define-key evil-normal-state-map (kbd "C-k") 'windmove-up)
(define-key evil-normal-state-map (kbd "C-l") 'windmove-right)

;; Evil-commentary
(unless (package-installed-p 'evil-commentary)
  (package-install 'evil-commentary))
(require 'evil-commentary)
(evil-commentary-mode)
