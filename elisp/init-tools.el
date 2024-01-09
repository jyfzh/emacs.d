(use-package projectile
  :bind (("C-c p" . projectile-command-map))
  :custom
  (projectile-mode-line "Projectile")
  (projectile-track-known-projects-automatically nil)
  :config
  (use-package counsel-projectile
    :after (projectile counsel)
    :init (counsel-projectile-mode)))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package wakatime-mode
  :hook (after-init . global-wakatime-mode))
  
(use-package fanyi
  :commands (fanyi-dwim fanyi-dwim2))
  
(use-package counsel
  :after ivy
  :init (counsel-mode 1))
  
(use-package swiper
  :after ivy)

(use-package ivy
  :custom
  (ivy-use-virtual-buffers t)
  (search-default-mode #'char-fold-to-regexp)
  (ivy-count-format "(%d/%d) ")
  (ivy-use-selectable-prompt t)
  :config
  (setq ivy-re-builders-alist '((t . ivy--regex-ignore-order)))
  (add-to-list 'ivy-highlight-functions-alist '(orderless-ivy-re-builder . orderless-ivy-highlight))
  (ivy-mode 1)
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c V" . 'ivy-pop-view)
   ("C-x C-@" . 'counsel-mark-ring)
   ("C-x C-SPC" . 'counsel-mark-ring)
   :map minibuffer-local-map
   ("C-r" . counsel-minibuffer-history)))

(use-package orderless
  :after ivy
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package amx
  :config
  (ivy-mode)
  (amx-mode))

(provide 'init-tools)
