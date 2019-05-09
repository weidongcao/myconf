;; --> close the voice of "bell" when roll then end of file
(setq ring-bell-function 'ignore)


(global-auto-revert-mode t)

;;- show line number
(global-linum-mode t)

;; --> abbreviation
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8zl" "zilongshanren")
					    ("8ms" "Macrosoft")
					    ))


;; --> no backup
(setq make-backup-files nil)


;; --> no auto recovery
(setq auto-save-default nil)

;;- recent file conf
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)


;; -->

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(delete-selection-mode t)
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(fset 'yes-or-no-p 'y-or-n-p)

;; --> recursion deelte directory
(setq dired-recursive-deletes 'always)

;; --> recursion copy directory
(setq dired-recursive-copies 'always)

(put 'dired-find-alterante-file 'disabled nil)

(require 'dired-x)
(provide 'init-better-defaults)
