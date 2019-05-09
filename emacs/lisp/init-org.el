(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(provide 'init-org)
