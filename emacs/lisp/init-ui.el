;; - turn off tool-bar
(tool-bar-mode 0)

;; - turn off scroll-bar
(scroll-bar-mode 0)

;; - turn off tutarial
(setq inhibit-splash-screen t)

;; cursor
(setq-default cursor-type 'bar)

;; full screen on start
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))

;; - show linum-mode
(global-linum-mode t)
(global-hl-line-mode t)



;;(set-default-font "-DAMA-Ubuntu Mono-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1")

(custom-set-faces '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 158 :width normal)))))
(provide 'init-ui)
