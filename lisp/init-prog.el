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

(provide 'init-prog)
