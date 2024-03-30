;; Enable vertico
(use-package vertico
    :init (vertico-mode)
    :config
    (setq vertico-resize t)
    (setq vertico-cycle t))

(use-package orderless
  :custom
  ;; (completion-styles '(orderless basic))
  ;; (completion-category-overrides '((file (styles basic partial-completion))))
    (setq completion-styles '(orderless flex)
        completion-category-overrides '((eglot (styles . (orderless flex))))))

(use-package corfu
    :custom
    (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
    (corfu-auto t)                 ;; Enable auto completion
    (corfu-separator ?\s)          ;; Orderless field separator
    (corfu-auto-prefix 1)
    (corfu-auto-delay 0.1)
    ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
    ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
    (corfu-preview-current t)    ;; Disable current candidate preview
    (corfu-preselect 'prompt)      ;; Preselect the prompt
    ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
    ;; (corfu-scroll-margin 5)        ;; Use scroll margin

    :init
    (global-corfu-mode))

(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand))
  :config
  (add-to-list 'dabbrev-ignored-buffer-regexps "\\` ")
  ;; Since 29.1, use `dabbrev-ignored-buffer-regexps' on older.
  (add-to-list 'dabbrev-ignored-buffer-modes 'doc-view-mode)
  (add-to-list 'dabbrev-ignored-buffer-modes 'pdf-view-mode))

(use-package eglot
  :defer t
  :config
  (setq read-process-output-max (* 1024 1024))
  (push :documentHighlightProvider eglot-ignored-server-capabilities))

(use-package treesit
    :ensure nil
    :init
    (setq treesit-language-source-alist
        '((bash "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-bash")
             (cmake "https://mirror.ghproxy.com/https://github.com/uyha/tree-sitter-cmake")
             (css "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-css")
             (elisp "https://mirror.ghproxy.com/https://github.com/Wilfred/tree-sitter-elisp")
             (go "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-go")
             (rust "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-rust")
             (html "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-html")
             (javascript "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
             (json "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-json")
             (make "https://mirror.ghproxy.com/https://github.com/alemuller/tree-sitter-make")
             (markdown "https://mirror.ghproxy.com/https://github.com/ikatyang/tree-sitter-markdown")
             (python "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-python")
             (toml "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-toml")
             (tsx "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
             (typescript "https://mirror.ghproxy.com/https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
             (yaml "https://mirror.ghproxy.com/https://github.com/ikatyang/tree-sitter-yaml")
             (typst "https://mirror.ghproxy.com/https://github.com/uben0/tree-sitter-typst")))
    :config (setq treesit-font-lock-level 4))


(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))

(use-package typst-ts-mode
    :straight (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
    :mode ("\\.tsp$" . typst-ts-mode)
    :custom
    ;; don't add "--open" if you'd like `watch` to be an error detector
    (typst-ts-mode-watch-options "--open")

    ;; experimental settings (I'm the main dev, so I enable these)
    (typst-ts-mode-enable-raw-blocks-highlight t)
    (typst-ts-mode-highlight-raw-blocks-at-startup t))

(use-package matlab-mode
    :mode ("\\.m$" . matlab-mode))

(provide 'init-prog)
