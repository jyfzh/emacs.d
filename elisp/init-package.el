(use-package package
  :config
  ;(setq package-archives '(("gnu"    . "http://elpa.gnu.org/packages/")
;			   ("nongnu" . "http://elpa.gnu.org/nongnu/")
;			   ("melpa"  . "https://stable.melpa.org/packages/")))
  (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (unless (bound-and-true-p package--initialized)
    ;; This line is just a raincheck
    (defvar use-package-verbose t)
    ;;Always ensure that the package is installed
    (defvar use-package-always-ensure t)
    (package-initialize)))

(provide 'init-package)
