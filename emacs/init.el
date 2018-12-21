;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

(require 'cl)

;; add whatever packages you want here
(defvar my/packages '(
				 company
				 monokai-theme
				 hungry-delete
				 swiper
				 counsel
				 smartparens
				 auctex
				 ) "Default packages")

(setq package-selected-packages my/packages)

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
;; (package-initialize)
;; -------------------------------------------------------------------------
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-company-mode t)

(require 'hungry-delete)
(global-hungry-delete-mode)

;; config for smex2
;; (require 'smex) ; Not needed if you use package.el
;; (smex-initialize) ; Can be omitted. This might cause a (minimal) delay
;;(global-set-key (kbd "M-x") 'smex)

(require 'smartparens-config)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;; config swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq-default TeX-master nil)

;; -------------------------------------------------------------------------
;; - turn off tutarial
(setq inhibit-splash-screen t)
;; - turn off tool-bar
(tool-bar-mode 0)

;; - turn off scroll-bar
(scroll-bar-mode 0)

;; - turn off splash screen
(electric-indent-mode t)

;; - show linum-mode
(global-linum-mode t)

;; color theme
;;(load-theme 'solarized-dark 1)		
(load-theme 'monokai t)

;; cursor
(setq-default cursor-type 'bar)

;; no backup files
(setq make-backup-files nil)


(delete-selection-mode t)

;; full screen on start
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; -------------------------------------------------------------------------
;; - save your config
;; - define a function to quickly open your config file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

;; -------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" default)))
 '(package-selected-packages
   (quote
    (auctex org company monokai-theme hungry-delete swiper counsel smartparens)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 181 :width normal)))))

