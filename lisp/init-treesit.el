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

    (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
    (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
    (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
    ;;(add-to-list 'auto-mode-alist '("\\.tsp\\'" . typst-ts-mode))

    :config (setq treesit-font-lock-level 4))


(use-package typst-ts-mode
  :straight (:type git :host sourcehut :repo "meow_king/typst-ts-mode")
  :custom
  ;; don't add "--open" if you'd like `watch` to be an error detector
  (typst-ts-mode-watch-options "--open")

  ;; experimental settings (I'm the main dev, so I enable these)
  (typst-ts-mode-enable-raw-blocks-highlight t)
  (typst-ts-mode-highlight-raw-blocks-at-startup t))

(use-package matlab-mode
    :mode ("\\.m$" . matlab-mode))

(provide 'init-prog)
