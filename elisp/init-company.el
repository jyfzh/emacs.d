(use-package company
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers 0)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))
  :config (global-company-mode))

(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

(use-package yasnippet
  :after company
  :hook (prog-mode . yas-minor-mode)
  :config (use-package yasnippet-snippets)) 

(provide 'init-company)
