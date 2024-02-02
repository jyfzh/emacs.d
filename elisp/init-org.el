(use-package org
	:hook
	(org-mode . org-indent-mode)
	:config
	(require 'org-tempo)
	(setq
		org-auto-align-tags nil
		org-tags-column 0
		org-catch-invisible-edits 'show-and-error
		org-special-ctrl-a/e t
		org-insert-heading-respect-content t

		;; Org styling, hide markup etc.
		org-hide-emphasis-markers t
		org-pretty-entities t
		org-ellipsis "…"

		;; Agenda styling
		org-agenda-tags-column 0
		org-agenda-block-separator ?─
		org-agenda-time-grid
		'((daily today require-timed)
			 (800 1000 1200 1400 1600 1800 2000)
			 " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
		org-agenda-current-time-string
		"◀── now ─────────────────────────────────────────────────"
		org-startup-with-inline-images t
		org-image-actual-width (/ (display-pixel-width) 3)
		org-clock-into-drawer t
		org-log-done 'time
		org-log-done 'note
		org-todo-keywords '((sequence "TODO(t)" "STARTED" "WAITING(w@/!" "|" "DONE(d!)" "CANCELLED(c@)"))

		; org-agenda
		org-refile-targets '((org-agenda-files :maxlevel . 2))
		org-agenda-dir "~/org/agenda/"
		org-agenda-files (list org-agenda-dir)
		org-agenda-habit-file (concat org-agenda-dir "/Habit.org")
		org-agenda-appointment-file (concat org-agenda-dir "/Appointment.org")
		org-agenda-project-file (concat org-agenda-dir "/Project.org")
		org-agenda-work-file (concat org-agenda-dir "/Work.org")
		org-agenda-life-file (concat org-agenda-dir "/Life.org")
										; org-capture
		org-capture-templates
		'(("h" "Habit" entry (file+headline org-agenda-habit-file "Habit") "* TODO %?\n")
			 ("a" "Appointment" entry (file+headline org-agenda-appointment-file "Appointment") "* TODO %?\n")
			 ("p" "Project" entry (file+headline org-agenda-project-file "Project") "* %?\n")
			 ("w" "Work" entry (file+function org-agenda-work-file (lambda ()
																	   (org-datetree-find-date-create
																		   (org-date-to-gregorian (org-today)) t)))
				 "* TODO %?\n" :empty-lines 1)
			 ("l" "Life" entry (file+headline org-agenda-life-file "Life") "* TODO %?\n" :prepend t)))

	(setq org-publish-project-alist
		'(("blog-notes"
			  :base-directory "~/org/note/"
			  :base-extension "org"
			  :publishing-directory "/usr/share/nginx/html"
			  :recursive t
			  :publishing-function org-html-publish-to-html
			  :headline-levels 4
			  :section-numbers nil
			  :auto-preamble t
			  :with-toc t
			  :sitemap-file-entry-format "%d ====> %t"
			  :sitemap-sort-files anti-chronologically
			  :sitemap-filename "index.org"
			  :sitemap-title "jyf home"
			  :auto-sitemap t
			  :html-doctype "html5"
			  :html-validation-link nil
			  :author "jyf"
			  :email "jyfendipity@outlook.com"
			  :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\"/>"
			  :language "zh-CN")

			 ("static"
				 :base-directory "~/org/note/"
				 :base-extension "css\\|js\\|txt\\|jpg\\|gif\\|png"
				 :recursive t
				 :publishing-directory "/usr/share/nginx/html"
				 :publishing-function org-publish-attachment)
			 ))
	:bind (("C-c a" . 'org-agenda)
			  ("C-c c" . 'org-capture)))

(use-package valign
	:hook (org-mode . valign-mode))

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
			  :if-new (file+head "default/${slug}.org" "#+title: ${title}\n\n* ${title}")
			  :unnarrowed t)
			 ("u" "utils" plain "%?"
  				 :if-new (file+head "utils/${slug}.org" "#+title: ${title}\n#+filetags: utils\n* ${title}")
  				 :unnarrowed t)
			 ("l" "programming language" plain "%?"
				 :if-new (file+head "language/${slug}.org" "#+title: ${title}\n#+filetags: language\n* ${title}")
				 :unnarrowed t)
			 ("t" "topic" plain "%?"
				 :if-new (file+head "topic/${slug}.org" "#+title: ${title}\n#+filetags: topic\n* ${title}")
				 :unnarrowed t)))
	(org-roam-db-autosync-mode))

(use-package org-noter
	:bind ("C-c n n" . org-noter)
	:custom
	(org-noter-notes-search-path '("~/Documents/notes/"))
	:config
	(setq org-noter-always-create-frame nil))

(provide 'init-org)
