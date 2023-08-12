;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setq confirm-kill-emacs nil)
(setq evil-default-state 'emacs)
(setq  org-latex-pdf-process '("tectonic -Z shell-escape %f"))


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "wedo"
      user-mail-address "caowd1990@163.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 18 :weight 'normal)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 18))
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;;(def-package! ox-hugo
;;  :after ox
;;  )


(use-package ox-hugo
  :ensure t   ;Auto-install the package from Melpa
  ;;:pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :after ox)

;; 设置任务流程(这是我的配置)
(setq org-todo-keywords
      '((sequence "未开始(p!)" "进行中(t!)" "阻塞中(s!)" "|" "已完成(d!)" "已取消(a@/!)")))

;; 设置任务样式
(setq org-todo-keyword-faces
   '(("未开始" .   (:foreground "red" :weight bold))
    ("阻塞中" .   (:foreground "red" :weight bold))
    ("进行中" .      (:foreground "orange" :weight bold))
    ("已完成" .      (:foreground "green" :weight bold))
    ("已取消" .     (:background "gray" :foreground "black"))
))

(setq org-startup-with-inline-images t)
(use-package org-download
  :ensure t   ;Auto-install the package from Melpa
  ;;:pin melpa  ;`package-archives' should already have ("melpa" . "https://melpa.org/packages/")
  :bind ("C-M-y" . wdp)
  :bind ("C-S-y" . org-download-clipboard)
  :config
    (require 'org-download)
    ;;; org-download
    (setq org-download-screenshot-method "flameshot gui --raw >%s")
    ; (setq org-download-method 'directory)
    (setq-default org-download-heading-lvl nil)
    (setq-default org-download-image-org-width 400)
    ;;(setq-default org-download-image-html-width 400)
    (setq-default org-download-image-dir "./images")
    ;;(defun dummy-org-download-annotate-function (link) "")
    ;;(setq org-download-annotate-function #'dummy-org-download-annotate-function)
  )

;;(setq org-startup-shrink-all-tables t)
;;(setq org-startup--align-all-tables t)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))

(defun my-org-inline-css-hook (exporter)
  "Insert custom inline css"
  (when (eq exporter 'html)
    (let* ((dir (ignore-errors (file-name-directory (buffer-file-name))))
           (path (concat dir "style.css"))
           (homestyle (or (null dir) (null (file-exists-p path))))
           (final (if homestyle "~/.config/doom/org-style.css" path))) ;; <- set your own style file path
     (message "final = %s" final)
      (setq org-html-head-include-default-style nil)
      (setq org-html-head (concat
                           "<style type=\"text/css\">\n"
                           "<!--/*--><![CDATA[/*><!--*/\n"
                           (with-temp-buffer
                             (insert-file-contents final)
                             (buffer-string))
                           "/*]]>*/-->\n"
                           "</style>\n")))))
(add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)



;; 使用xelatex，配合当前org文件最开始的配置来正常输出中文
  ;; 这类笔记基本不可能是全英文，所以就安心用xelatex算了
  (setq org-latex-pdf-process '("xelatex -file-line-error -interaction nonstopmode %f"
                                "bibtex %b"
                                "xelatex -file-line-error -interaction nonstopmode %f"
                                "xelatex -file-line-error -interaction nonstopmode %f"))

  ;; 生成PDF后清理辅助文件
  ;; https://answer-id.com/53623039
  (setq org-latex-logfiles-extensions
    (quote ("lof" "lot" "tex~" "tex" "aux"
      "idx" "log" "out" "toc" "nav"
      "snm" "vrb" "dvi" "fdb_latexmk"
      "blg" "brf" "fls" "entoc" "ps"
      "spl" "bbl" "xdv")))

  ;; 图片默认宽度
  (setq org-image-actual-width '(300))

  (setq org-export-with-sub-superscripts nil)

  ;; 不要自动创建备份文件
  (setq make-backup-files nil)

  ;; elegantpaper.cls
  ;; https://github.com/ElegantLaTeX/ElegantPaper/blob/master/elegantpaper.cls
  (with-eval-after-load 'ox-latex
  ;; http://orgmode.org/worg/org-faq.html#using-xelatex-for-pdf-export
  ;; latexmk runs pdflatex/xelatex (whatever is specified) multiple times
  ;; automatically to resolve the cross-references.
  ; (setq org-latex-pdf-process '("latexmk -xelatex -quiet -shell-escape -f %f"))
  (setq org-latex-listings t)
  (add-to-list 'org-latex-classes
                '("elegantpaper"
                  "\\documentclass[lang=cn]{elegantpaper}
                  [NO-DEFAULT-PACKAGES]
                  [PACKAGES]
                  [EXTRA]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  )

(defun hello-with-universal-arg (arg)
  "Say hello with input universal arg."
  (interactive "p")
  (message "Hello! universal arg = %s" arg))
