(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)


(global-set-key "\C-x\ \C-r" 'recentf-open-files)


(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c C-p f") 'counsel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; --> 在 Company-mode 中使用 C-n 与 C-p 来选择补全项
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;; --> 
(global-set-key (kbd "C-=") 'er/expand-region)

;; --> iedit 是一个可以同时编辑多个区域的插件，它类似 Sublime Text 中的多光标编辑
(global-set-key (kbd "M-s e") 'iedit-mode)

;; -->
(global-set-key (kbd "C-c C-p s") 'helm-do-ag-project-root)

;; --> auto-yasnippet 是一个非常好用代码块补全插件
(global-set-key (kbd "H-w") #'aya-create)
(global-set-key (kbd "H-y") #'aya-expand)

;; --> 将 C-w 来使其可以向后删除一个单词，这样就可以与 Shell 中的快捷键操作同步
(global-set-key (kbd "C-w") 'backward-kill-word)

;; --> Ctrl + Z切换Emacs模式
;;(global-set-key (kbd "C-w") 'evil-toggle-key)

(provide 'init-keybindings)
