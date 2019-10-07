(show-paren-mode t)
(global-hl-line-mode t)

(setq-default c-basic-offset 2)

(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (concat user-emacs-directory "places"))

(setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                               "backups"))))
(setq auto-save-default nil)

;; use 2 spaces for tabs
(defun die-tabs ()
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))

;; fix weird os x kill error
(defun ns-get-pasteboard ()
  "Returns the value of the pasteboard, or nil for unsupported formats."
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq electric-indent-mode nil)

(windmove-default-keybindings)

(setq-default require-final-newline t mode-require-final-newline t )

(run-with-idle-timer 2 nil (lambda () (global-auto-revert-mode t)))

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(global-git-gutter-mode +1)

(global-subword-mode 1)

(setq dumb-jump-use-visible-window nil)
