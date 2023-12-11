(use-package multiple-cursors
  :defer t
  :ensure t
  :config
  (setq mc/list-file (expand-file-name "multiple-cursors-list-file" wk-cfg-dir)) ;; 有些命令会询问是否应用到所有光标，然后该命令的 是/否 会被缓存到这个文件中
  :bind ("C-S-c C-S-c" . mc/edit-lines))


(use-package avy
  :bind (("C-'" . avy-goto-char-timer) ;; Control + 单引号
         ;; 复用上一次搜索
         ("C-c C-j" . avy-resume))
  :config
  (setq avy-background t ;; 打关键字时给匹配结果加一个灰背景，更醒目
        avy-all-windows t ;; 搜索所有 window，即所有「可视范围」
        avy-timeout-seconds 0.3)) ;; 「关键字输入完毕」信号的触发时间

(use-package mwim
  :ensure t
  :bind
  ("C-a" . mwim-beginning-of-code-or-line)
  ("C-e" . mwim-end-of-code-or-line))


(provide 'init-edit)
