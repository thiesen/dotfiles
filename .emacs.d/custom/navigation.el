(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 40)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq smex-save-file (concat user-emacs-directory ".smex-items"))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(setq projectile-require-project-root nil)
(setq ag-highlight-search t)
(setq ag-reuse-window nil)

(global-set-key (kbd "C-x C-d") 'ido-dired)

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-format-function 'ivy-format-function-arrow)

(setq projectile-completion-system 'ivy)

(setq magit-completing-read-function 'ivy-completing-read)
(require 'counsel)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
