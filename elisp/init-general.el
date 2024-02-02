(electric-pair-mode t)
(savehist-mode 1)
(auto-save-mode 1)
(global-auto-revert-mode t)
(delete-selection-mode t)
(setq make-backup-files nil)
(fset 'yes-or-no-p 'y-or-n-p)
(pixel-scroll-precision-mode 1)
(setq auto-hscroll-mode 'currentline)
(setq inhibit-startup-message t)
;(set-face-attribute 'default nil :font "Jetbrains Mono" :height 160)
(set-frame-font "JetBrainsMono 16" nil t)

(defun open-emacs-config ()
	"Open the Emacs configuration file."
	(interactive)
	(find-file "~/.config/emacs/elisp"))

(defun open-agenda-file ()
	"Open the agenda file."
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

(use-package tab-bar
	:ensure nil
	:init
	(tab-bar-mode t)
	(setq tab-bar-new-tab-choice "*scratch*") ;; buffer to show in new tabs
	(setq tab-bar-close-button-show nil)      ;; hide tab close / X button
	(setq tab-bar-show 1)                     ;; hide bar if <= 1 tabs open
	(setq tab-bar-format '(tab-bar-format-tabs tab-bar-separator))
	(setq tab-bar-tab-hints t))

(provide 'init-general)
