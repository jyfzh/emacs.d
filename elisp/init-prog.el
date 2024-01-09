(add-hook 'prog-mode-hook (lambda ()
			    (setq show-paren-mode t)
			    (setq hs-minor-mode t)
			    (setq display-line-numbers-type 'relative)
			    (display-line-numbers-mode t)))

(add-hook 'c-ts-mode #'lsp-deferred)
(add-hook 'c++-ts-mode #'lsp-deferred)
(add-hook 'python-ts-mode #'lsp-deferred)
(add-hook 'rust-ts-mode #'lsp-deferred)
(add-hook 'go-ts-mode #'lsp-deferred)

(use-package treesit-auto
  :hook (prog-mode . treesit-auto-mode)
  ;:custom
  ;(treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package hideshow
  :diminish hs-minor-mode
  :hook (prog-mode . hs-minor-mode)
  :bind (("C-c C-h" . hs-hide-all)
	 ("C-c C-s" . hs-show-all)))

(use-package igist
  :bind (("M-o" . igist-dispatch)))

(use-package magit
  :commands magit)

(use-package git-gutter
  :hook (prog-mode . global-git-gutter-mode))

(provide 'init-prog)
