(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 40)

;; (setq smex-save-file (concat user-emacs-directory ".smex-items"))
;; (smex-initialize)


(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-require-project-root nil)
(setq ag-highlight-search t)
(setq ag-reuse-window nil)

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-format-function 'ivy-format-function-arrow)
(setq ivy-re-builders-alist
      '((swiper . regexp-quote)
        (t      . ivy--regex-fuzzy)))
(setq ivy-initial-inputs-alist nil)

(setq magit-completing-read-function 'ivy-completing-read)
(setq projectile-completion-system 'ivy)

;(setq ivy-extra-directories nil)

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
(setq history-delete-duplicates t)

(require 'ivy-rich)
(ivy-rich-mode 1)
