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

(defun custom/generate-scratch-buffer ()
  "Create and switch to a temporary scratch buffer with a random
     name."
  (interactive)
  (switch-to-buffer (make-temp-name "scratch-")))

(defun custom/visit-emacs-config ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun custom/visit-todo ()
  (interactive)
  (find-file "~/.todo.org"))

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
