(add-hook 'prog-mode-hook (lambda ()
							  (setq show-paren-mode t)
							  (setq hs-minor-mode t)
							  (setq display-line-numbers-type 'relative)
							  (display-line-numbers-mode t)))

(use-package go-mode
	:config
	(add-hook 'go-mode-hook 'eglot-ensure))

(use-package eglot
	:hook
	(c-mode . 'eglot-ensure)
	(c++-mode . 'eglot-ensure)
	:bind (("C-c a" . eglot-code-actions)
			  ("C-c r" . eglot-rename)
			  ("C-c f" . eglot-format-buffer)))

(use-package flymake
	:ensure nil
	:bind (("C-c [" . ' flymake-goto-prev-error)
			  ("C-c ]" . ' flymake-goto-prev-error)))

(use-package company
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers 0)
  (setq company-selection-wrap-around t)
  (setq company-transformers '(company-sort-by-occurrence))
  (global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package yasnippet
  :hook (company-mode . yas-minor-mode)
  :config (use-package yasnippet-snippets))

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

(provide 'init-prog)
