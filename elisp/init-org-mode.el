(use-package org
  :hook
  (org-mode . (lambda () (setq truncate-lines nil)))
  (org-mode . org-indent-mode)
  :config
  (setq org-agenda-files '("~/Org/Agenda"))
  (setq org-capture-templates
    '(("p" "project" entry (file+headline "~/Org/Agenda/project.org" "Project") "* %?\n%T")
     ("i" "inbox" entry (file+headline "~/Org/Agenda/inbox.org" "Inbox") "* %?\n%T" :prepend t)
     ("t" "todo" entry (file+headline "~/Org/Agenda/todo.org" "Todo") "* %?\n%T" :prepend t)))

  :bind
  (("C-c a" . 'org-agenda)
   ("C-c c" . 'org-capture)))
  
(use-package org-modern
  :after org
  :ensure t
  :hook (
  (org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda)))

(use-package org-roam
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Org/Roam/"))
  :bind (("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ("C-c n d" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  ;(require 'org-roam-protocol)
)

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'agenda))

(provide 'init-org-mode)
