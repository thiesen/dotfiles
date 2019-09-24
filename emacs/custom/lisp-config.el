;; eldoc-mode shows documentation in the minibuffer when writing code
;; http://www.emacswiki.org/emacs/ElDoc
(setq inferior-lisp-program "ros -Q run")
(setq slime-contribs '(slime-fancy))
(load (expand-file-name "~/.roswell/helper.el"))
