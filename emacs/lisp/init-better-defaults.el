(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

(setq-default abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; Shifu
                                            ("8cwd" "caoweidong")
                                            ;; Tudi
                                            ("8lxy" "lixinyang")
                                           ))

;;disable auto-save and auto-backup
(setq auto-save-default nil)
(setq make-backup-files nil)

;; (require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 
(delete-selection-mode t)


;; - turn off splash screen
;; (electric-indent-mode t)

(provide 'init-better-defaults)
