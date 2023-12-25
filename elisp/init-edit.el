(use-package crux
  :ensure t
)

(use-package multiple-cursors
  :defer t
  :ensure t
  :config
  (setq mc/list-file (expand-file-name "multiple-cursors-list-file" wk-cfg-dir)) ;; 有些命令会询问是否应用到所有光标，然后该命令的 是/否 会被缓存到这个文件中
  :bind ("C-S-c C-S-c" . mc/edit-lines))

(use-package avy
  :bind (("C-'" . avy-goto-char-timer)
	 ("C-c C-j" . avy-resume)) ;; 复用上一次搜索
  :config
  (setq avy-all-windows t
	avy-timeout-seconds 0.3))

(use-package mwim
  :ensure t
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line)))

(provide 'init-edit)
