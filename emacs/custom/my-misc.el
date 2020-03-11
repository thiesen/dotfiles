(fset 'yes-or-no-p 'y-or-n-p)

(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

(set-language-environment "UTF-8")
(setenv "LANG" "en_US.UTF-8")

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)


(async-bytecomp-package-mode 1)
(persistent-scratch-setup-default)
(setq-default bidi-display-reordering nil)

(setenv "PAGER" (executable-find "cat"))

(dumb-jump-mode)
(move-text-default-bindings)
