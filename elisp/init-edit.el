(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package multiple-cursors
    :config (setq mc/list-file (expand-file-name "multiple-cursors-list-file" wk-cfg-dir))
    :bind ("C-S-c C-S-c" . mc/edit-lines))

(use-package avy
  :custom
  (avy-all-windows t)
  (avy-timeout-seconds 0.3)
  :bind (("C-l" . avy-goto-char-2)
	 ("C-c C-j" . avy-resume))
  :config
  (use-package ace-pinyin :defer)
  (ace-pinyin-global-mode +1))

(use-package mwim
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line)))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(provide 'init-edit)
