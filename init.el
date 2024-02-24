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
         "https://mirror.ghproxy.com/https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
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
