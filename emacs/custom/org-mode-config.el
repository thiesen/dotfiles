(setq initial-major-mode 'org-mode)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js         . t)
   (emacs-lisp . t)
   (clojure    . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (css        . t)
   (go         . t)
   (lisp       . t)
   (shell      . t)
   (plantuml   . t)
   (restclient . t)))



(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/vendor/plantuml.jar"))
(setq org-ellipsis "⤵")
(setq org-replace-disputed-keys t)
(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)
(setq org-src-window-setup 'current-window)
(setq org-confirm-babel-evaluate nil)
(setq org-support-shift-select 'always)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)")))

(eval-after-load "org"
  '(progn
     (require 'ox-md nil t)
     (require 'ox-gfm nil t)))
