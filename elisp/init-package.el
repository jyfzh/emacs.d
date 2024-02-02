(setq package-quickstart t)
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

(provide 'init-package)
