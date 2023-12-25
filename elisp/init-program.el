(use-package rust-mode
  :ensure t)
  
(use-package cargo
  :ensure t
  :hook
  (rust-ts-mode . cargo-minor-mode))

(provide 'init-program)
