;; https://johnsogg.github.io/emacs-golang

(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH"))

(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))

(require 'go-guru)

(require 'company-go)

(require 'flycheck-gometalinter)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(define-key go-mode-map (kbd "C-c , v") 'go-test-current-file)
(define-key go-mode-map (kbd "C-c , b") 'go-test-current-file-benchmarks)
(define-key go-mode-map (kbd "C-x x") 'go-run)
