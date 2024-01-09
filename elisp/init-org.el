(use-package org
  :hook
  (org-mode . org-indent-mode)
  (org-mode . (lambda () (setq truncate-lines nil)))
  :config
  ; org
  (setq org-startup-with-inline-images t)
  (setq org-image-actual-width (/ (display-pixel-width) 3))
  (setq org-clock-into-drawer t)
  (setq org-log-done 'time)
  (setq org-log-done 'note)
  (setq org-todo-keywords '((sequence "TODO(t)" "STARTED" "WAITING(w@/!" "|" "DONE(d!)" "CANCELLED(c@)")))
  ; org-agenda
  (setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
  (setq org-agenda-dir "~/org/agenda")
  (setq org-agenda-files (list org-agenda-dir))
  (setq org-agenda-habit-file (concat org-agenda-dir "/Habit.org"))
  (setq org-agenda-appointment-file (concat org-agenda-dir "/Appointment.org"))
  (setq org-agenda-project-file (concat org-agenda-dir "/Project.org"))
  (setq org-agenda-work-file (concat org-agenda-dir "/Work.org"))
  (setq org-agenda-life-file (concat org-agenda-dir "/Life.org"))
  ; org-capture
  (setq org-capture-templates
	'(("h" "Habit" entry (file+headline org-agenda-habit-file "Habit") "* %?\n")
	  ("a" "Appointment" entry (file+headline org-agenda-appointment-file "Appointment") "* %?\n")
	  ("p" "Project" entry (file+headline org-agenda-project-file "Project") "* %?\n")
	  ("d" "Work" entry (file+function org-agenda-work-file (lambda ()
								    (org-datetree-find-date-create
								     (org-date-to-gregorian (org-today)) t)))
	   "* %?\n%U" :empty-lines 1)
	  ("l" "Life" entry (file+headline org-agenda-life-file "Life") "* %?\n" :prepend t)))

  :bind
  (("C-c a" . 'org-agenda)
   ("C-c c" . 'org-capture)))

(use-package org-download
  :hook (org-mode . org-download-enable)
  :config
  (setq-default org-download-image-dir "./images")
  (setq org-download-annotate-function 'ignore))

(use-package valign
  :after org
  :hook (org-mode . valign-mode))

(use-package org-modern
  :after org
  :hook (
	 (org-mode . org-modern-mode)
	 (org-agenda-finalize . org-modern-agenda)))

(use-package org-roam
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ("C-c n d" . org-roam-dailies-capture-today)
	 ("C-c n r" . org-roam-node-random))
  :custom
  (org-roam-directory (file-truename "~/org/note/roam/"))
  :config
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:25}" 'face 'org-tag)))
  (setq org-roam-database-connector 'sqlite-builtin)
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?"
	   :if-new (file+head "default/${slug}.org" "#+title: ${title}\n")
	   :unnarrowed t)
	  ("u" "utils" plain "%?"
  	   :if-new (file+head "utils/${slug}.org" "#+title: ${title}\n#+filetags: utils")
  	   :unnarrowed t)
	  ("l" "programming language" plain "%?"
	   :if-new (file+head "language/${slug}.org" "#+title: ${title}\n#+filetags: language")
	   :unnarrowed t)
	  ("p" "project" plain "%?"
	   :if-new (file+head "project/${slug}.org" "#+title: ${title}\n#+filetags: project")
	   :unnarrowed t)))
  :config
  (org-roam-db-autosync-mode))

(provide 'init-org)
