(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(use-package package
  :config
  (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			   ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (setq use-package-verbose t)
  (unless (bound-and-true-p package--initialized)
    (defvar use-package-always-ensure t)
    (package-initialize)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key vertico valign org-roam org-bullets orderless mwim multiple-cursors marginalia magit git-gutter editorconfig corfu amx)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package emacs
  :init
  (save-place-mode)
  (savehist-mode 1)
  (auto-save-visited-mode 1)
  (whitespace-mode)
  (global-hl-line-mode)
  (global-so-long-mode)
  (global-auto-revert-mode t)
  (delete-selection-mode t)
  (pixel-scroll-precision-mode 1)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq auto-save-mode nil)
  (setq split-width-threshold 1)
  (setq make-backup-files nil)
  (setq auto-hscroll-mode 'currentline)
  (setq inhibit-startup-message t)
  (setq package-quickstart t)
  (set-frame-font "Cascadia Code-12.0" nil t)
  (setq tab-always-indent 'complete)
  (windmove-default-keybindings)
  (set-cursor-color "white")

  :config
  (global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
  (global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (global-set-key (kbd "S-C-<down>") 'shrink-window)
  (global-set-key (kbd "S-C-<up>") 'enlarge-window))

(use-package isearch
  :ensure nil
  :bind (:map isearch-mode-map
	      ([remap isearch-delete-char] . isearch-del-char))
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "%s/%s ")
  (lazy-highlight-cleanup nil))

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package multiple-cursors
  :config (setq mc/list-file (expand-file-name "multiple-cursors-list-file" wk-cfg-dir))
  :bind ("C-S-c C-S-c" . mc/edit-lines))

(use-package mwim
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
   ("C-e" . mwim-end-of-code-or-line)))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package magit
  :commands magit)

(use-package git-gutter
  :hook (prog-mode . global-git-gutter-mode))

(use-package amx
  :config (amx-mode))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package vertico
  :init (vertico-mode)
  :config
  (setq vertico-resize t)
  (setq vertico-cycle t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

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


;; org mode
(use-package org
  :hook (org-mode . org-indent-mode)
  :config
  (require 'org-tempo)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))

  (setq org-startup-with-inline-images t
	org-image-actual-width (/ (display-pixel-width) 3)
	org-clock-into-drawer t
	org-log-done 'time
	org-log-done 'note
	org-todo-keywords '((sequence "TODO(t)" "STARTED" "WAITING(w@/!" "|" "DONE(d!)" "CANCELLED(c@)"))

        ;; org-agenda
	org-refile-targets '((org-agenda-files :maxlevel . 2))
	org-agenda-dir "~/OneDrive/org/agenda"
	org-agenda-files (list org-agenda-dir)
	org-agenda-habit-file (concat org-agenda-dir "/Habit.org")
	org-agenda-appointment-file (concat org-agenda-dir "/Appointment.org")
	org-agenda-project-file (concat org-agenda-dir "/Project.org")
	org-agenda-work-file (concat org-agenda-dir "/Work.org")
	org-agenda-life-file (concat org-agenda-dir "/Life.org")
	;; org-capture
	org-capture-templates
	'(
          ("h" "Habit" entry (file+headline org-agenda-habit-file "Habit") "* TODO %?\n")
	  ("a" "Appointment" entry (file+headline org-agenda-appointment-file "Appointment") "* TODO %?\n")
	  ("p" "Project" entry (file+headline org-agenda-project-file "Project") "* TODO %?\n")
	  ("w" "Work" entry (file+headline org-agenda-work-file "Work") "* TODO %?\n")
	  ("l" "Life" entry (file+headline org-agenda-life-file "Life") "* TODO %?\n")
          )
        )

  :bind (("C-c a" . 'org-agenda)
	 ("C-c c" . 'org-capture)))

(use-package valign :hook (org-mode . valign-mode))
(use-package org-bullets :hook (org-mode . (lambda () (org-bullets-mode 1))))

(use-package ox-publish
  :ensure nil
  :config
  (setq org-publish-project-alist
	'(("notes"
	   :base-directory "~/OneDrive/org/note/"
	   :base-extension "org"
	   :publishing-directory "/var/www/html/"
	   :recursive t
	   :publishing-function org-html-publish-to-html
	   :headline-levels 4
	   :section-numbers nil
	   :auto-preamble t
	   :with-toc t
           :style-include-default nil
           :auto-sitemap t
	   :sitemap-file-entry-format "%d ====> %t"
	   :sitemap-sort-files anti-chronologically
	   :sitemap-filename "sitemap.org"
	   :sitemap-title "jyf blog"
	   :html-doctype "html5"
	   :html-validation-link nil
           :with-author t
	   :author "蒋雨峰"
	   :email "jyf.work@outlook.com"
	   :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"/>"
	   :language "zh-CN")

	  ("static"
	   :base-directory "~/OneDrive/org/note/"
	   :base-extension "css\\|js\\|txt\\|jpg\\|gif\\|png"
	   :recursive t
	   :publishing-directory "/var/www/html/"
	   :publishing-function org-publish-attachment)
          ("site" :components ("notes" "static"))
          )))

(use-package org-roam
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ("C-c n d" . org-roam-dailies-capture-today)
	 ("C-c n r" . org-roam-node-random))
  :config
  (setq org-roam-directory (file-truename "~/org/note/"))
  (setq org-roam-dailies-directory "../journal/")
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:25}" 'face 'org-tag)))
  (setq org-roam-database-connector 'sqlite-builtin)
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?"
	   :if-new (file+head "default/${slug}.org" "#+title: ${title}\n\n")
	   :unnarrowed t)
	  ("u" "utils" plain "%?"
  	   :if-new (file+head "utils/${slug}.org" "#+title: ${title}\n#+filetags: utils\n#+AUTO_EXPORT: t\n")
  	   :unnarrowed t)
	  ("l" "programming language" plain "%?"
	   :if-new (file+head "language/${slug}.org" "#+title: ${title}\n#+filetags: language\n#+AUTO_EXPORT: t\n")
	   :unnarrowed t)
	  ("t" "topic" plain "%?"
	   :if-new (file+head "topic/${slug}.org" "#+title: ${title}\n#+filetags: topic\n#+AUTO_EXPORT: t\n")
	   :unnarrowed t)))
  (org-roam-db-autosync-mode))
