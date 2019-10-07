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
(setq custom/default-font-size 14.5)
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
