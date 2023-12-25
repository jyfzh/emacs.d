(use-package treesit-auto
  :ensure t
  :config (global-treesit-auto-mode))

(use-package which-key
  :ensure t
  :defer t
  :config
  ;(which-key-setup-side-window-bottom)
  ;(which-key-setup-minibuffer)
  ;; Allow C-h to trigger which-key before it is done automatically
  ;(setq which-key-show-early-on-C-h t)
  ;; make sure which-key doesn't show normally but refreshes quickly after it is
  ;; triggered.
  ;(setq which-key-idle-delay 10000)
  ;(setq which-key-idle-secondary-delay 0.05)
  ;(which-key-mode))
  :hook (after-init . which-key-mode))

(use-package wakatime-mode
  :ensure t
  :config (global-wakatime-mode))

(use-package fanyi
  :ensure t)

(use-package counsel
  :ensure t)

(use-package projectile
  :ensure t
  :bind (("C-c p" . projectile-command-map))
  :config
  (setq projectile-mode-line "Projectile")
  (setq projectile-track-known-projects-automatically nil))

(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :init (counsel-projectile-mode))

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-use-selectable-prompt t)
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring); 在某些终端上 C-x C-SPC 会被映射为 C-x C-@，比如在 macOS 上，所以要手动设置
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(use-package amx
  :ensure t
  :init (amx-mode))

(use-package undo-tree
  :ensure t
  :init (global-undo-tree-mode)
  :custom
  (undo-tree-auto-save-history nil))

(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-tag-follow-mode)
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  (:map treemacs-mode-map
	("/" . treemacs-advanced-helpful-hydra)))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package lsp-treemacs
  :ensure t
  :after (treemacs lsp))

(use-package magit
  :ensure t)

(use-package newsticker
  :ensure t
  :config
  (setq newsticker-url-list
	'(
          ;; ("title" "URL" other options)
          ;; 这里使用上面的格式，添加 RSS 源
					; ("Planet Emacs Life" "https://planet.emacslife.com/atom.xml" nil nil nil)
	  ("hellogithub" "https://hellogithub.com/rss/" nil nil nil)
          ))
)

(provide 'init-tools)
