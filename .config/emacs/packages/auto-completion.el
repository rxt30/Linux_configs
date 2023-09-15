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
