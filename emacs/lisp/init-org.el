(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/.emacs.d"))
;;(setq org-agenda-files '("~/org/"))
(global-set-key (kbd "C-c a") 'org-agenda)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n  %i\n"
	 :empty-lines 1)))

(global-set-key (kbd "C-c r") 'org-capture)


;; --> org-agenda-windows 位置显示在右边
(setq split-height-threshold nil)
(setq split-width-threshold 0)

(provide 'init-org)
