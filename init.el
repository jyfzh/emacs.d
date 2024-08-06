(setq custom-file (expand-file-name "~/.config/emacs/custom.el"))
(if (file-exists-p custom-file)
    (load custom-file))

;; Font
(set-face-attribute 'default nil
                    :family "Microsoft YaHei UI-12.0" :height 145 :weight 'normal)
(set-language-environment "utf-8")
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-clipboard-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default pathname-coding-system 'utf-8)
(setq
 default-process-coding-system '(utf-8 . utf-8)
 locale-coding-system 'utf-8
 file-name-coding-system 'utf-8
 default-buffer-file-coding-system 'utf-8
 slime-net-coding-system 'utf-8-unix)

(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")                           ; Iterate through CamelCase words

;; 基本设置
(setq-default
 indicate-buffer-boundaries 'left ;; 在窗口边缘上显示一个小箭头指示当前 buffer 的边界
 delete-by-moving-to-trash t       ;; 删除文件移动到垃圾箱
 window-combination-resize t     ;; 新窗口平均其他左右窗口
 x-stretch-cursor t                      ;; 将光标拉伸到字形宽度
 kill-whole-line t)                        ;; C-k时,同时删除该行

;;; Tidy workdir
(make-directory "~/.config/emacs/data/backup/" t)
(setq auto-save-file-name-transforms '((".*" "~/.config/emacs/data/backup/" t)) ; Write auto-save files to a separate directory
      backup-directory-alist '(("." . "~/.config/emacs/data/backup/"))          ; Write backup files to a separate directory
      create-lockfiles nil)                                                 ; Disable lockfiles as I use only one Emacs instance

(setq
 fringes-outside-margins t   ;; fringe 放在外面
 echo-keystrokes 0.1         ;; 尽快显示按键序列
 system-time-locale "zh_CN"  ;; 设置系统时间显示格式
 tab-always-indent 'complete ;; Tab 键优先格式化再补全
 font-lock-global-modes '(not shell-mode text-mode) ;; 设置语法高亮.除shell-mode和text-mode之外的模式
 mouse-yank-at-point t       ;; 不在鼠标点击的地方插入剪贴板内容
 kill-ring-max 200           ;; 设置 kill ring 个数
 default-fill-column 60      ;; 把fill-column设为60.让文字更好读
 enable-recursive-minibuffers t  ;; 递归的使用minibuffer
 scroll-margin 3             ;; 在靠近屏幕边沿 3 行时就开始滚动,可很好看到上下文
 scroll-conservatively 10000 ;; 防止页面滚动时跳动
 select-enable-clipboard t   ;; 允许emacs和外部程序进行粘贴
 track-eol t                 ;; 当光标在行尾上下移动的时候,始终保持在行尾
 next-line-add-newlines nil  ;; 按C-n或down时不添加新行
 ;; emacs启动时显示的内容可以通过变量initial-scratch-message来设置
 initial-scratch-message nil
 dired-listing-switches "-vha" ;;  dired 列出文件的参数（man ls）
 show-paren-style 'parenthesis ;; 括号匹配时高亮显示另一边的括号，而不是跳到另一个括号处
 undo-limit 80000000           ;; 提升撤销限制
 auto-save-default t           ;; 打开自动保存
 truncate-string-ellipsis "…"  ;; Unicode ellispis are nicer than "...", and also save /precious/ space
 ;; 当寻找一个同名的文件,改变两个buffer的名字,前面加上目录名
 uniquify-buffer-name-style 'post-forward-angle-brackets)
(if (display-graphic-p)
    (progn
      (menu-bar-mode -1)            ;; 取消菜单栏
      (scroll-bar-mode -1)          ;; 取消滚动条（在 Emacs 26 中无效）
      (tool-bar-mode -1)))          ;; 取消工具栏
(fset 'yes-or-no-p 'y-or-n-p) ;; 按y或space表示yes,n表示no
(global-font-lock-mode t)     ;; 语法高亮
(show-paren-mode t)           ;; 打开括号匹配显示模式
(mouse-avoidance-mode 'animate) ;; 鼠标靠近光标指针时,让鼠标自动让开
(auto-compression-mode 1) ;; 打开压缩文件时自动解压缩
(global-auto-revert-mode 1)       ;; 自动重载更改的文件
(blink-cursor-mode -1)            ;; 指针不要闪
(toggle-truncate-lines t)         ;; 当一行文字太长时,不自动换行
(column-number-mode t)            ;; 在minibuffer上面的状态栏显示文件的行号,列号
(line-number-mode t)              ;;设定显示文件的参数,以版本/人性化的显示,就是ls的参数
(require 'saveplace)
(save-place-mode 1)               ;; 记住上次打开文件光标的位置
(global-subword-mode 1)           ;; 拆分连字符：oneWord 会被当作两个单词处理

;; 设置4个空格缩进
(setq-default indent-tabs-mode nil)
(setq tab-width 4) ; or any other preferred value

;; 时间显示设置
(display-time-mode 1)   ;; 启用时间显示设置,在minibuffer上面的那个杠上
(setq display-time-24hr-format t   ;; 时间使用24小时制
      display-time-day-and-date t   ;; 时间显示包括日期和具体时间
      display-time-use-mail-icon t   ;; 时间栏旁边启用邮件设置
      display-time-interval 10   ;; 时间的变化频率
      display-time-format "%A %H:%M")   ;; 显示时间的格式

(unless (string-match-p "^Power N/A" (battery))   ; 笔记本上显示电量
  (display-battery-mode 1))

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(use-package package
  :config
  (setq package-archives '(("gnu"    . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			   ("melpa"  . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (setq use-package-verbose t)
  (unless (bound-and-true-p package--initialized)
    (defvar use-package-always-ensure t)
    (package-initialize)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key vertico valign org-roam org-bullets orderless mwim multiple-cursors marginalia magit git-gutter editorconfig corfu amx)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package isearch
  :ensure nil
  :bind (:map isearch-mode-map
	      ([remap isearch-delete-char] . isearch-del-char))
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "%s/%s ")
  (lazy-highlight-cleanup nil))

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package multiple-cursors
  :config (setq mc/list-file (expand-file-name "multiple-cursors-list-file" wk-cfg-dir))
  :bind ("C-S-c C-S-c" . mc/edit-lines))

(use-package mwim
  :bind
  (("C-a" . mwim-beginning-of-code-or-line)
   ("C-e" . mwim-end-of-code-or-line)))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package magit
  :commands magit)

(use-package git-gutter
  :hook (prog-mode . global-git-gutter-mode))

(use-package amx
  :config (amx-mode))

(use-package marginalia
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package vertico
  :init (vertico-mode)
  :config
  (setq vertico-resize t)
  (setq vertico-cycle t))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; org mode
(use-package valign :hook (org-mode . valign-mode))
(use-package org-bullets :hook (org-mode . (lambda () (org-bullets-mode 1))))
(use-package org
  :hook (org-mode . org-indent-mode)
  :config
  (require 'org-tempo)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)))

  (setq org-startup-with-inline-images t
	org-image-actual-width (/ (display-pixel-width) 3)))

(use-package org-roam
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n i" . org-roam-node-insert)
	 ("C-c n c" . org-roam-capture)
	 ("C-c n r" . org-roam-node-random))
  :config
  (setq org-roam-directory (file-truename "~/org/note/"))
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:25}" 'face 'org-tag)))
  (setq org-roam-database-connector 'sqlite-builtin)
  (setq org-roam-capture-templates
	'(("d" "default" plain "%?":if-new (file+head "default/${slug}.org" "#+title: ${title}\n\n") :unnarrowed t)
	  ("u" "utils" plain "%?" :if-new (file+head "utils/${slug}.org" "#+title: ${title}\n#+filetags: utils\n\n") :unnarrowed t)
	  ("l" "programming language" plain "%?" :if-new (file+head "language/${slug}.org" "#+title: ${title}\n#+filetags: language\n\n") :unnarrowed t)
	  ("t" "topic" plain "%?" :if-new (file+head "topic/${slug}.org" "#+title: ${title}\n#+filetags: topic\n\n") :unnarrowed t)))
  (org-roam-db-autosync-mode))
