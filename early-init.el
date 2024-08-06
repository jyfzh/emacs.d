(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq-default cursor-type 'bar)
(setq default-frame-alist (append default-frame-alist '((alpha-background . 85))))
(setq frame-inhibit-implied-resize t)
