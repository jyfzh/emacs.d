(set-frame-font "JetBrainsMono 14" nil t)
(setq default-frame-alist (append default-frame-alist '((alpha-background . 70))))

(use-package dashboard
  :config (dashboard-setup-startup-hook))

(use-package all-the-icons
  :if (display-graphic-p)
  :config
  (use-package all-the-icons-dired
    :hook (dired-mode . all-the-icons-dired-mode)))

;; Enable rich annotations using the Marginalia package
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init

  ;; Marginalia must be activated in the :init section of use-package such that
  ;; the mode gets enabled right away. Note that this forces loading the
  ;; package.
  (marginalia-mode))

(provide 'init-ui)
