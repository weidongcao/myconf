(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/org"))

(provide 'init-org)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
