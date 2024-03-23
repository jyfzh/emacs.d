(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

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

(use-package package
    :config
    (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                                ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			                    ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
    (setq use-package-verbose t)
    (unless (bound-and-true-p package--initialized)
        ;; This line is just a raincheck
                                        ; (defvar use-package-verbose t)
        ;;Always ensure that the package is installed
        (defvar use-package-always-ensure t)
        (package-initialize)))

(use-package auto-package-update
    :ensure t
    :config
    (setq auto-package-update-delete-old-versions t)
    (setq auto-package-update-hide-results t)
    (auto-package-update-maybe))

(require 'init-general)
(require 'init-org)
(require 'init-prog)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
      '(matlab-mode org-roam org-bullets valign corfu orderless marginalia vertico doom-modeline doom-themes dashboard rainbow-delimiters consult git-gutter magit amx wakatime-mode which-key expand-region mwim avy multiple-cursors editorconfig auto-package-update)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
