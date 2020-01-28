(require 'uniquify)

(require 'recentf)
(recentf-mode t)


;; (setq smex-save-file (concat user-emacs-directory ".smex-items"))
;; (smex-initialize)


(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(ivy-mode 1)

(defun eh-ivy-open-current-typed-path ()
  (interactive)
  (when ivy--directory
    (let* ((dir ivy--directory)
           (text-typed ivy-text)
           (path (concat dir text-typed)))
      (delete-minibuffer-contents)
      (ivy--done path))))

(define-key ivy-minibuffer-map (kbd "<return>") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "C-f") 'eh-ivy-open-current-typed-path)
(define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial)

(require 'counsel)


(require 'ivy-rich)
(ivy-rich-mode 1)
