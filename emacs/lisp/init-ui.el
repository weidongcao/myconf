;; - turn off tool-bar
(tool-bar-mode -1)

;;- turn off scroll-bar
(scroll-bar-mode -1)

;; - turn off auto-fill mode
(toggle-truncate-lines 1)

;;- turn off splash screen
(setq inhibit-splash-screen t)

;; --> cursor style
(setq-default cursor-type 'bar)


;; --> Frame size (height, width)
(setq default-frame-alist
      '((height . 60)(width . 160)))

(global-hl-line-mode t)

(provide 'init-ui)
