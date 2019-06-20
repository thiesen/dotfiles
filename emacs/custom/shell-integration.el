(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
   '("PATH" "GOPATH" "GOROOT" "ANSIBLE_VAULT_PASSWORD_FILE" "NVM_DIR")))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
