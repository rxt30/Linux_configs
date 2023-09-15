(unless (package-installed-p 'highlight-indent-guides)
  (package-install 'highlight-indent-guides))
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
