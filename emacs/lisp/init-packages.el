(require 'cl)
(when (>= emacs-major-version 24)
  (require 'package)

  ;;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
  ;;                         ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                           ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))
2 
;; add whatever packages you want here
(defvar wedo/packages '(
			company
			color-theme-sanityinc-tomorrow
			spacemacs-theme
			zenburn-theme
			solarized-theme
			monokai-theme
			spacemacs-theme			  
			hungry-delete
			swiper
			counsel
			smartparens
			js2-mode
			nodejs-repl
			popwin
			web-mode
			js2-refactor
			expand-region
			iedit
			org-pomodoro
			helm-ag
			flycheck
			auto-yasnippet
			evil
			evil-leader
			window-numbering
			;; powerline
			evil-surround
			evil-nerd-commenter
			which-key
			) "Default packages")

(setq package-selected-packages wedo/packages)

(defun wedo/packages-installed-p ()
  (loop for pkg in wedo/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (wedo/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg wedo/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

					;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)


(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; --> Web-mode相关配置
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
	 ("\\.html\\'" . web-mode))
       auto-mode-alist))

;; --> Web-mode模型下的缩进
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 4) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 4)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 4)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)


(global-company-mode t)

;;(load-theme 'monokai t)
;;(load-theme 'solarized-theme t)

(require 'popwin)
(popwin-mode t)

;; --> js2-refactor 相关配置
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")
;; --> LaTeX配置
;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)


;; --> 番茄工作法在org-mode中的使用
(require 'org-pomodoro)

;; --> 语法检查器
(add-hook 'js2-mode-hook 'flycheck-mode)

;; --> 语法检查器
;; (global-flycheck-mode t)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)

;; --> Emacs下使用Vim
;; --> 在 Emacs 中使用 Leader Key 可以通过 evil-leader 来实现
(global-evil-leader-mode)
(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)


(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )

(require 'evil-surround)
(global-evil-surround-mode)

(window-numbering-mode 1)

(evilnc-default-hotkeys)

(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

;; --> which-key 可以显示当前组合键下所有可以使用的全部组合键的选项
(which-key-mode 1)
(provide 'init-packages)
