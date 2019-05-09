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
			  monokai-theme
			  ;;spacemacs-theme			  
			  hungry-delete
			  swiper
			  counsel
			  smartparens
			  js2-mode
			  nodejs-repl
			  popwin
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

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)

(provide 'init-packages)
