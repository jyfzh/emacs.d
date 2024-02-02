(use-package matlab-mode
  :mode ("\\.m$" . matlab-mode)
  :config
  (setq matlab-indent-function t)
  (setq matlab-shell-command "matlab"))

(provide 'init-matlab)

