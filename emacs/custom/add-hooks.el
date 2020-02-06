;;; add hooks
;;
;; Switch to ‘inf-ruby-mode’ if the breakpoint pattern matches the current line.
(add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)

;; Modify ‘rspec-compilation-mode’ and ‘ruby-compilation-mode’
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;;org-mode stuff
;; use custom bullets on org-mode
(add-hook 'org-mode-hook 'org-bullets-mode)

;; truncate lines in org-mode
(add-hook 'org-mode-hook (lambda () (setq truncate-lines t)))

;; allow windmove in org mode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; use custom/org-summary-todo for managing list state
(add-hook 'org-after-todo-statistics-hook 'custom/org-summary-todo)

;; completion on ssh-mode (TODO: not working right now :( )
(add-hook 'ssh-mode-hook
          (lambda ()
            (setq ssh-directory-tracking-mode t)
            (setq dirtrackp nil)))

;;enable flyspell on github flavoured markdown mode
(add-hook 'gfm-mode-hook 'flyspell-mode)

;;enable flyspell on org mode
(add-hook 'org-mode-hook 'flyspell-mode)

;;enable flyspell for git commit messages
(add-hook 'git-commit-mode-hook 'flyspell-mode)

;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; enable flycheck mode by default
(add-hook 'after-init-hook #'global-flycheck-mode)

;; enable company mode by default
(add-hook 'after-init-hook 'global-company-mode)

;; define which commands to use ansi-term when invoked on eshell
(add-hook 'eshell-mode-hook
          (lambda ()
            (add-to-list 'eshell-visual-commands "ssh")
            (add-to-list 'eshell-visual-commands "tail")
            (add-to-list 'eshell-visual-commands "top")))

;; turn on eldoc on emacs lisp mode
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; turn on eldoc on lisp mode
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)

;; turn on eldoc on ielm mode
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; translate ansi sgr escape sequences (like `Esc [ 30 m`) in shell mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; add my-go-mode-hook to go-mode
(add-hook 'go-mode-hook 'my-go-mode-hook)
