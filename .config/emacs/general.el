;; Enable line numbers
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(global-set-key (kbd "TAB") 'indent-according-to-mode)
(global-set-key [tab] 'indent-according-to-mode)
(electric-pair-mode)
