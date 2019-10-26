;; font resizing functions
(defun custom/font-code ()
  "Return a string representing the current font (like \"Inconsolata-14\")."
  (concat custom/default-font "-" (number-to-string custom/current-font-size)))

(defun custom/set-font-size ()
  "Set the font to `custom/default-font' at `custom/current-font-size'.
Set that for the current frame, and also make it the default for
other, future frames."
  (let ((font-code (custom/font-code)))
    (add-to-list 'default-frame-alist (cons 'font font-code))
    (set-frame-font font-code)))

(defun custom/reset-font-size ()
  "Change font size back to `custom/default-font-size'."
  (interactive)
  (setq custom/current-font-size custom/default-font-size)
  (custom/set-font-size))

(defun custom/increase-font-size ()
  "Increase current font size by a factor of `custom/font-change-increment'."
  (interactive)
  (setq custom/current-font-size
        (ceiling (* custom/current-font-size custom/font-change-increment)))
  (custom/set-font-size))

(defun custom/decrease-font-size ()
  "Decrease current font size by a factor of `custom/font-change-increment', down to a minimum size of 1."
  (interactive)
  (setq custom/current-font-size
        (max 1
             (floor (/ custom/current-font-size custom/font-change-increment))))
  (custom/set-font-size))

;; custom rename-file function that doesn't require to specify which file to rename
(defun custom/rename-file (new-name)
  (interactive "FNew name: ")
  (let ((filename (buffer-file-name)))
    (if filename
        (progn
          (when (buffer-modified-p)
             (save-buffer))
          (rename-file filename new-name t)
          (kill-buffer (current-buffer))
          (find-file new-name)
          (message "Renamed '%s' -> '%s'" filename new-name))
      (message "Buffer '%s' isn't backed by a file!" (buffer-name)))))

;; generate scratch buffer
(defun custom/generate-scratch-buffer ()
  "Create and switch to a temporary scratch buffer with a random
     name."
  (interactive)
  (switch-to-buffer (make-temp-name "scratch-")))

;; open init.el file
(defun custom/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; visit todo file
(defun custom/visit-todo ()
  (interactive)
  (find-file "~/.todo.org"))

;;  move current line up and down
(defun custom/move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun custom/move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;; comment/uncomment current line or region

(defun custom/get-line-or-region-beginning ()
  "return the position of the beginning of the region or end of line (whatever is lower)"
  (if (region-active-p)
    (min (region-beginning) (line-beginning-position))
    (line-beginning-position)))

(defun custom/get-line-or-region-end ()
  "return the position of the end of the region or end of line (whatever is higher)"
  (if (region-active-p)
      (max (region-end) (line-end-position))
    (line-end-position)))

(defun custom/toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (custom/get-line-or-region-beginning)
                               (custom/get-line-or-region-end)))

;; set list to done if all subentries are done
(defun custom/org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

;; clear eshell buffer
(defun eshell/clear ()
  "Clear the eshell buffer."
  (let ((inhibit-read-only t))
    (erase-buffer)
    (eshell-send-input)))

;; open a new eshell on the current directory
(defun custom/eshell-here ()
  "Opens up a new shell in the directory associated with the current buffer's file."
  (interactive)
  (let* ((parent (file-name-directory (buffer-file-name)))
         (name   (car
                  (last
                   (split-string parent "/" t)))))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

;; go functions
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

  (auto-complete-mode t)
  (gorepl-mode 1)
  (go-eldoc-setup)
  (set (make-local-variable 'company-backends)
       '(company-go)))
