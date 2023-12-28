(use-package lsp-mode
  :ensure t
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (
	 (c-ts-mode . lsp-deferred)
	 (c++-ts-mode . lsp-deferred)
	 (python-ts-mode . lsp-deferred)
	 (rust-ts-mode . lsp-deferred)
	 (go-ts-mode . lsp-deferred)
	 (lsp-mode . lsp-enable-which-key-integration)
  )
  :commands (lsp lsp-deferred)
  :config (setq lsp-auto-guess-root t))

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :files ("dist" "*.el"))
  :ensure t
  :hook ((prog-mode . copilot-mode)
	 (copilot-mode . (lambda ()
			   (setq-local copilot--indent-warning-printed-p t))))
  :config
  (define-key copilot-completion-map (kbd "<tab>") 'copilot-accept-completion)
  (define-key copilot-completion-map (kbd "TAB") 'copilot-accept-completion))

(use-package flycheck
  :ensure t
  :config
  (setq truncate-lines nil)
  :hook
  (prog-mode . flycheck-mode))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(provide 'init-lsp)
