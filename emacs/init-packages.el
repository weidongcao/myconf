(require 'cl)

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; add whatever packages you want here
(defvar my/packages '(
				 company
				 monokai-theme
				 hungry-delete
				 swiper
				 counsel
				 smartparens
				 auctex
				 popwin
				 ) "Default packages")

(setq package-selected-packages my/packages)


(defun my/packages-installed-p ()
     (loop for pkg in my/packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

(unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)


(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(global-hungry-delete-mode)

(global-company-mode t)

;; color theme
;;(load-theme 'solarized-dark 1)		
(load-theme 'monokai t)

(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
