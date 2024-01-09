(electric-pair-mode t)
(savehist-mode 1)
(auto-save-mode 1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(setq make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)
(pixel-scroll-precision-mode 1)

(defun open-emacs-config ()
  "Open the Emacs configuration file."
  (interactive)
  (find-file "~/.config/emacs/elisp"))

(defun open-agenda-config ()
  "Open the Emacs configuration file."
  (interactive)
  (find-file "~/org/agenda"))

(use-package winner-mode
  :ensure nil
  :hook (after-init . winner-mode))

(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))

(use-package hl-line
  :ensure nil
  :hook (after-init . global-hl-line-mode))

(use-package whitespace
  :ensure nil
  :hook ((prog-mode markdown-mode conf-mode) . whitespace-mode)
  :config
  (setq whitespace-style '(face trailing)))

(use-package so-long
  :ensure nil
  :config (global-so-long-mode 1))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode))

(use-package isearch
  :ensure nil
  :bind (:map isearch-mode-map
         ([remap isearch-delete-char] . isearch-del-char))
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "%s/%s ")
  (lazy-highlight-cleanup nil))

(provide 'init-general)
