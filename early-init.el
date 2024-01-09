(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook #'(lambda () (setq gc-cons-threshold 800000)))

; (setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0) 
(scroll-bar-mode 0)

(load-theme 'wombat)

