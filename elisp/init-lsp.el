(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands (lsp lsp-deferred)
  :config (setq lsp-auto-guess-root t))

(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode)

(use-package lsp-treemacs
  :after lsp-mode
  :commands lsp-treemacs-errors-list)

(use-package lsp-ivy
  :after lsp-mdoe
  :commands lsp-ivy-workspace-symbol)

(provide 'init-lsp)
