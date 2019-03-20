(setq initial-major-mode 'org-mode)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

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
   (lisp       . t)))

(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-ellipsis "⤵")
(setq org-replace-disputed-keys t)
(setq org-src-tab-acts-natively t)
(setq org-src-fontify-natively t)
(setq org-src-window-setup 'current-window)
(setq org-confirm-babel-evaluate nil)
(setq org-support-shift-select 'always)

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)



(defun custom/org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'custom/org-summary-todo)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)")))

(eval-after-load "org"
  '(progn
     (require 'ox-md nil t)
     (require 'ox-gfm nil t)))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))
