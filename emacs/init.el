;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory s.
 
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'org-install)
(require 'ob-tangle)

(org-babel-load-file (expand-file-name "wedo.org" user-emacs-directory ))
