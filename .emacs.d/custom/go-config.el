;; https://johnsogg.github.io/emacs-golang

(when (memq window-system '(mac ns))
  (exec-path-from-shell-copy-env "GOPATH"))


(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))

  (go-guru-hl-identifier-mode)

  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  (local-set-key (kbd "M-p") 'compile)
  (local-set-key (kbd "M-P") 'recompile)
  (local-set-key (kbd "M-]") 'next-error)
  (local-set-key (kbd "M-[") 'previous-error)
  (local-set-key (kbd "C-c C-c") 'go-run-buffer)

  (auto-complete-mode 1))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(require 'go-guru)

(require 'company-go)
(add-hook 'go-mode-hook (lambda ()
                         (company-mode)
                         (set (make-local-variable 'company-backends)
                              '(company-go))))

(require 'flycheck-gometalinter)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(go-eldoc-setup)
