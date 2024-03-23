(use-package org
	:hook (org-mode . org-indent-mode)
	:config
	(require 'org-tempo)
    (org-babel-do-load-languages
       'org-babel-load-languages
        '((python . t)))

	(setq
		org-startup-with-inline-images t
		org-image-actual-width (/ (display-pixel-width) 3)
		org-clock-into-drawer t
		org-log-done 'time
		org-log-done 'note
		org-todo-keywords '((sequence "TODO(t)" "STARTED" "WAITING(w@/!" "|" "DONE(d!)" "CANCELLED(c@)"))

		; org-agenda
		org-refile-targets '((org-agenda-files :maxlevel . 2))
		org-agenda-dir "~/org/agenda"
		org-agenda-files (list org-agenda-dir)
		org-agenda-habit-file (concat org-agenda-dir "/Habit.org")
		org-agenda-appointment-file (concat org-agenda-dir "/Appointment.org")
		org-agenda-project-file (concat org-agenda-dir "/Project.org")
		org-agenda-work-file (concat org-agenda-dir "/Work.org")
		org-agenda-life-file (concat org-agenda-dir "/Life.org")
										; org-capture
		org-capture-templates
		'(
             ("h" "Habit" entry (file+headline org-agenda-habit-file "Habit") "* TODO %?\n")
			 ("a" "Appointment" entry (file+headline org-agenda-appointment-file "Appointment") "* TODO %?\n")
			 ("p" "Project" entry (file+headline org-agenda-project-file "Project") "* TODO %?\n")
			 ("w" "Work" entry (file+headline org-agenda-work-file "Work") "* TODO %?\n")
			 ("l" "Life" entry (file+headline org-agenda-life-file "Life") "* TODO %?\n")
             )
        )

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

(use-package valign :hook (org-mode . valign-mode))
(use-package org-bullets :hook (org-mode . (lambda () (org-bullets-mode 1))))

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
  				 :if-new (file+head "utils/${slug}.org" "#+title: ${title}\n#+filetags: utils\n")
  				 :unnarrowed t)
			 ("l" "programming language" plain "%?"
				 :if-new (file+head "language/${slug}.org" "#+title: ${title}\n#+filetags: language\n")
				 :unnarrowed t)
			 ("t" "topic" plain "%?"
				 :if-new (file+head "topic/${slug}.org" "#+title: ${title}\n#+filetags: topic\n")
				 :unnarrowed t)))
	(org-roam-db-autosync-mode))

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
      "/CANCELED" 'file))

(provide 'init-org)
