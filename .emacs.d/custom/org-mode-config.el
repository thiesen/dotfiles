(setq initial-major-mode 'org-mode)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(setq org-replace-disputed-keys t)

(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((js         . t)
   (emacs-lisp . t)
   (clojure    . t)
   (python     . t)
   (ruby       . t)
   (dot        . t)
   (css        . t)
   (go         . t)))
