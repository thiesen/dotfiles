(when (memq window-system '(mac ns))
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

(setq create-lockfiles nil)

(setq inhibit-startup-message t)

(setq doc-view-continuous t)

(set-language-environment "UTF-8")
(setenv "LANG" "en_US.UTF-8")
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq ring-bell-function 'ignore)

(setq initial-scratch-message nil)

(setq large-file-warning-threshold nil)

(add-hook 'ssh-mode-hook
          (lambda ()
            (setq ssh-directory-tracking-mode t)
            (shell-dirtrack-mode t)
            (setq dirtrackp nil)))

(async-bytecomp-package-mode 1)
(persistent-scratch-setup-default)
(setq-default bidi-display-reordering nil)

(global-set-key (kbd "C-c e") 'custom/visit-emacs-config)

(global-set-key [(control shift up)]  'move-line-up)
(global-set-key [(control shift down)]  'move-line-down)

(setenv "PAGER" (executable-find "cat"))

(defun proced-settings ()
  (proced-toggle-auto-update))

(add-hook 'proced-mode-hook 'proced-settings)
