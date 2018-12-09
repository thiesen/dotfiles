(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH")))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
