(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-show-quick-access t nil nil "Customized with use-package company")
 '(elfeed-feeds
	  '("https://blog.15cm.net/atom.xml" "https://rss.shab.fun/github/issue/GitHubDaily/GitHubDaily" "https://us1.campaign-archive.com/feed?u=faa8eb4ef3a111cef92c4f3d4&id=e505c88a2e" "https://hellogithub.com/rss" "http://www.matrix67.com/blog/feed" "https://netcan.github.io/atom.xml" "https://rss.shab.fun/github/issue/Wechat-ggGitHub/Awesome-GitHub-Repo" "https://rss.shab.fun/github/issue/cssmagic/blog" "https://feed.ipcfun.com" "https://iui.su/feed/" "https://www.solidot.org/index.rss" "https://www.appinn.com/feed/" "https://sspai.com/feed" "https://feed.iplaysoft.com" "https://www.zhihu.com/rss" "https://coolshell.cn/feed" "http://www.ruanyifeng.com/blog/atom.xml" "https://www.freedidi.com/feed" "https://emacstalk.codeberg.page/podcast/index.xml"))
 '(ignored-local-variable-values
	  '((eval setq-local org-roam-directory
			(expand-file-name "./"))))
 '(org-agenda-files
	  '("/home/jyf/org/agenda/Appointment.org" "/home/jyf/org/agenda/Life.org" "/home/jyf/org/agenda/Project.org" "/home/jyf/org/agenda/School.org" "/home/jyf/org/agenda/Work.org"))
 '(package-selected-packages '(which-key use-package projectile magit counsel company)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

;; straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(require 'init-package)
(require 'init-general)
(require 'init-ui)
(require 'init-edit)
(require 'init-tools)

(require 'init-org)
(require 'init-paper)
(require 'init-prog)

(require 'init-matlab)
