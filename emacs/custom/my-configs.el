;;; general
;; do not display startup message
(setq inhibit-startup-message t)

;; set org-mode as initial major mode
(setq initial-major-mode 'org-mode)

;; empty scratch
(setq initial-scratch-message nil)

;; do not set a ring bell function
(setq ring-bell-function 'ignore)

;; scroll compilation buffer as output appears
(setq compilation-scroll-output t)

;; in continuos mode, advance the page when reaching its edge
(setq doc-view-continuous t)

;; use utf-8 on system messages
(setq locale-coding-system 'utf-8)

;; do not ask for confirmation when openning large files
(setq large-file-warning-threshold nil)

;; do not create lockfiles like xunda.#-emacsa08196
(setq create-lockfiles nil)

;; use clipboard for cutting and pasting
(setq select-enable-clipboard t)

;; save existing clipboard text into kill ring before replacing it
(setq save-interprogram-paste-before-kill t)

;; apropos commands search more extensively
(setq apropos-do-all t)

;; do not use tabs for indentation
(setq-default indent-tabs-mode nil)

;; tab width
(setq-default tab-width 2)

;;; fonts
;; default font
(setq custom/default-font "Inconsolata")

;; default font size
(setq custom/default-font-size 13)
(setq custom/current-font-size custom/default-font-size)

;; font size change increment
(setq custom/font-change-increment 1.05)



;;; mac stuff
(when (memq window-system '(mac ns))
  ;; unset option key as meta
  (setq mac-option-key-is-meta nil)
  ;; set command as meta
  (setq mac-command-key-is-meta t)
  ;; set meta as command modifier
  (setq mac-command-modifier 'meta)
  ;; unset option key
  (setq mac-option-modifier nil))


;;; org-mode
;; plantuml jar path
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/vendor/plantuml.jar"))

;; set an arrow as ellipsis
(setq org-ellipsis "⤵")

;; allow the use of shift in org mode
(setq org-replace-disputed-keys t)

;; tab in code blocks act as if it was issued in language's mode
(setq org-src-tab-acts-natively t)

;; fontify code in code blocks
(setq org-src-fontify-natively t)

;; open code block editor in current window
(setq org-src-window-setup 'current-window)

;; do not ask for confirmation to evaluate code blocks
(setq org-confirm-babel-evaluate nil)

;; enable shit selection
(setq org-support-shift-select 'always)

;; define todo list keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "CANCELED(c)")))

;;; ruby
;; do not indent weirdly inside parenthesis
(setq ruby-deep-indent-paren nil)

;; allow only one rspec buffer at a time
(setq rspec-allow-multiple-compilation-buffers nil)


;; do not add encoding comment on enhaced ruby mode
(setq enh-ruby-add-encoding-comment-on-save nil)

;; not add encoding comment on ruby mode
(setq ruby-insert-encoding-magic-comment nil)

;;; web
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

;;; general
(setq save-place-file (concat user-emacs-directory "places"))
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
(setq auto-save-default nil)

(setq electric-indent-mode nil)

;;; dumb jump
(setq dumb-jump-use-visible-window nil)

;;; eshell
(setq eshell-scroll-to-bottom-on-input 'all)
(setq eshell-error-if-no-glob t)
(setq eshell-hist-ignoredups t)
(setq eshell-save-history-on-exit t)
(setq eshell-prefer-lisp-functions nil)
(setq eshell-destroy-buffer-when-process-dies t)
(setq eshell-history-size 1024)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")
(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize ((lambda (p-lst)
            (if (> (length p-lst) 3)
                (concat
                 (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                            (substring elm 0 1)))
                            (butlast p-lst 3)
                            "/")
                 "/"
                 (mapconcat (lambda (elm) elm)
                            (last p-lst 3)
                            "/"))
              (mapconcat (lambda (elm) elm)
                         p-lst
                         "/")))
          (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground "yellow"))
         (or (curr-dir-git-branch-string (eshell/pwd)))
         (propertize "$ " 'face 'default))))

(setq eshell-highlight-prompt nil)
(setq eshell-buffer-shorthand t)

;;; slime
(setq inferior-lisp-program "ros -Q run")
(setq slime-contribs '(slime-fancy))


(setq uniquify-buffer-name-style 'forward)
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(setq recentf-max-menu-items 40)
(setq projectile-require-project-root nil)
;;; ag
(setq ag-highlight-search t)
(setq ag-reuse-window nil)
;;; ivy
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-format-function 'ivy-format-function-arrow)
(setq ivy-re-builders-alist
      '((swiper . regexp-quote)
        (t      . ivy--regex-fuzzy)))
(setq ivy-initial-inputs-alist nil)

(setq magit-completing-read-function 'ivy-completing-read)
(setq projectile-completion-system 'ivy)

;(setq ivy-extra-directories nil)
(setq history-delete-duplicates t)

(setq user-full-name "Nathan P. Thiesen")
(setq user-mail-address "thiesen@tuta.io")

(setq remote-file-name-inhibit-cache nil)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq tramp-verbose 1)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; pinentry
(setq epa-pinentry-mode 'loopback)
(pinentry-start)

;; docker
(setq docker-command "podman")
