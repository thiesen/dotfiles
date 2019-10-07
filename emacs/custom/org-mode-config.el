(org-babel-do-load-languages
 'org-babel-load-languages
 '((js         . t)
   (emacs-lisp . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (go         . t)
   (lisp       . t)
   (shell      . t)
   (plantuml   . t)
   (restclient . t)))

(eval-after-load "org"
  '(progn
     (require 'ox-md nil t)
     (require 'ox-gfm nil t)))
