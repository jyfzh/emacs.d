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

(use-package which-key
	:hook (after-init . which-key-mode))

(use-package wakatime-mode
	:hook (after-init . global-wakatime-mode))

(use-package amx
	:config (amx-mode))

(use-package hideshow
	:diminish hs-minor-mode
	:hook (prog-mode . hs-minor-mode)
	:bind (("C-c C-h" . hs-hide-all)
			  ("C-c C-s" . hs-show-all)))

(use-package magit
	:commands magit)

(use-package git-gutter
	:hook (prog-mode . global-git-gutter-mode))

;; Example configuration for Consult
(use-package consult
	;; Replace bindings. Lazily loaded due by `use-package'.
	:bind (;; C-c bindings in `mode-specific-map'
			  ("C-c M-x" . consult-mode-command)
			  ("C-c h" . consult-history)
			  ("C-c k" . consult-kmacro)
			  ("C-c m" . consult-man)
			  ("C-c i" . consult-info)
			  ([remap Info-search] . consult-info)
			  ;; C-x bindings in `ctl-x-map'
			  ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
			  ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
			  ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
			  ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
			  ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
			  ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
			  ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
			  ;; Custom M-# bindings for fast register access
			  ("M-#" . consult-register-load)
			  ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
			  ("C-M-#" . consult-register)
			  ;; Other custom bindings
			  ("M-y" . consult-yank-pop)                ;; orig. yank-pop
			  ;; M-g bindings in `goto-map'
			  ("M-g e" . consult-compile-error)
			  ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
			  ("M-g g" . consult-goto-line)             ;; orig. goto-line
			  ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
			  ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
			  ("M-g m" . consult-mark)
			  ("M-g k" . consult-global-mark)
			  ("M-g i" . consult-imenu)
			  ("M-g I" . consult-imenu-multi)
			  ;; M-s bindings in `search-map'
			  ("M-s d" . consult-find)                  ;; Alternative: consult-fd
			  ("M-s c" . consult-locate)
			  ("M-s g" . consult-grep)
			  ("M-s G" . consult-git-grep)
			  ("M-s r" . consult-ripgrep)
			  ("M-s l" . consult-line)
			  ("M-s L" . consult-line-multi)
			  ("M-s k" . consult-keep-lines)
			  ("M-s u" . consult-focus-lines)
			  ;; Isearch integration
			  ("M-s e" . consult-isearch-history)
			  :map isearch-mode-map
			  ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
			  ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
			  ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
			  ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
			  ;; Minibuffer history
			  :map minibuffer-local-map
			  ("M-s" . consult-history)                 ;; orig. next-matching-history-element
			  ("M-r" . consult-history))                ;; orig. previous-matching-history-element

	;; Enable automatic preview at point in the *Completions* buffer. This is
	;; relevant when you use the default completion UI.
	:hook (completion-list-mode . consult-preview-at-point-mode)

	;; The :init configuration is always executed (Not lazy)
	:init

	;; Optionally configure the register formatting. This improves the register
	;; preview for `consult-register', `consult-register-load',
	;; `consult-register-store' and the Emacs built-ins.
	(setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)

	;; Optionally tweak the register preview window.
	;; This adds thin lines, sorting and hides the mode line of the window.
	(advice-add #'register-preview :override #'consult-register-window)

	;; Use Consult to select xref locations with preview
	(setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

	;; Configure other variables and modes in the :config section,
	;; after lazily loading the package.
	:config

	;; Optionally configure preview. The default value
	;; is 'any, such that any key triggers the preview.
	;; (setq consult-preview-key 'any)
	;; (setq consult-preview-key "M-.")
	;; (setq consult-preview-key '("S-<down>" "S-<up>"))
	;; For some commands and buffer sources it is useful to configure the
	;; :preview-key on a per-command basis using the `consult-customize' macro.
	(consult-customize
		consult-theme :preview-key '(:debounce 0.2 any)
		consult-ripgrep consult-git-grep consult-grep
		consult-bookmark consult-recent-file consult-xref
		consult--source-bookmark consult--source-file-register
		consult--source-recent-file consult--source-project-recent-file
		;; :preview-key "M-."
		:preview-key '(:debounce 0.4 any))

	;; Optionally configure the narrowing key.
	;; Both < and C-+ work reasonably well.
	(setq consult-narrow-key "<") ;; "C-+"

	;; Optionally make narrowing help available in the minibuffer.
	;; You may want to use `embark-prefix-help-command' or which-key instead.
	;; (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

	;; By default `consult-project-function' uses `project-root' from project.el.
	;; Optionally configure a different project root function.
  ;;;; 1. project.el (the default)
	;; (setq consult-project-function #'consult--default-project--function)
  ;;;; 2. vc.el (vc-root-dir)
	;; (setq consult-project-function (lambda (_) (vc-root-dir)))
  ;;;; 3. locate-dominating-file
	;; (setq consult-project-function (lambda (_) (locate-dominating-file "." ".git")))
  ;;;; 4. projectile.el (projectile-project-root)
	;; (autoload 'projectile-project-root "projectile")
	;; (setq consult-project-function (lambda (_) (projectile-project-root)))
  ;;;; 5. No project support
	;; (setq consult-project-function nil)
	)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package dashboard
	:config (dashboard-setup-startup-hook))

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-one t)
  (doom-themes-visual-bell-config)
  (doom-themes-org-config))

(use-package doom-modeline
    :init (doom-modeline-mode 1))

(use-package highlight-indent-guides
    :init (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
    :defer t
    :config
    (setq highlight-indent-guides-method 'character)
    (setq highlight-indent-guides-character ?\┊)
    (setq highlight-indent-guides-auto-character-face-perc 75))

;; Enable vertico
(use-package vertico
  :init (vertico-mode)
  :config
  ; (setq vertico-scroll-margin 0)
  ; (setq vertico-count 20)
  (setq vertico-resize t)
  (setq vertico-cycle t))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package marginalia
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(provide 'init-tools)
