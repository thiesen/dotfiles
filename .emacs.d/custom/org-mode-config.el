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

(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-ellipsis "⤵")

(setq org-src-fontify-natively t)
(setq org-src-window-setup 'current-window)
(setq org-confirm-babel-evaluate nil)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))

(eval-after-load "org"
  '(progn
     (require 'ox-md nil t)
     (require 'ox-gfm nil t)))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))
