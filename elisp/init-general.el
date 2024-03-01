; (electric-pair-mode t)
(winner-mode)
(save-place-mode)
(savehist-mode 1)
(auto-save-mode 1)
(whitespace-mode)
(global-hl-line-mode)
(global-so-long-mode)
(global-auto-revert-mode t)
(delete-selection-mode t)
(pixel-scroll-precision-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq make-backup-files nil)
(setq auto-hscroll-mode 'currentline)
(setq inhibit-startup-message t)
(setq package-quickstart t)
(set-frame-font "JetBrainsMono 14" nil t)
; (set-face-attribute 'default nil :font "Jetbrains Mono" :height 160)

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
