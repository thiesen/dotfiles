(add-to-list 'default-frame-alist '(fullscreen . maximized))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("ed317c0a3387be628a48c4bbdb316b4fa645a414838149069210b66dd521733f" default)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (magit ssh rvm projectile-rails evil sudo-edit sudo-save slime smartparens auto-complete git-gutter smex go-mode flx-ido projectile flycheck use-package color-theme)))
 '(projectile-globally-ignored-file-suffixes (quote ("~" "#")))
 '(same-window-buffer-names (quote ("*Directory*")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#232629" :foreground "#eff0f1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :family "Inconsolata")))))

;; hooks

;;; before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; packages
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package ido
  :ensure t
  :init (progn (setq ido-enable-flex-matching t)
               (setq ido-everywhere t)
               (setq ido-use-faces nil)
               (setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
               )
  :config (progn (ido-mode t)
                 (defun ido-disable-line-truncation ()
                   (set (make-local-variable 'truncate-lines) nil))
                 (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
                 (defun ido-define-keys ()
                   (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
                   (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
                 (add-hook 'ido-setup-hook 'ido-define-keys)))
(use-package flx-ido
  :ensure t
  :config (flx-ido-mode t))
(use-package color-theme
  :ensure t
  :init (progn (color-theme-initialize)
               (color-theme-dark-laptop)))
(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))
(use-package projectile
  :ensure t
  :init (setq projectile-require-project-root nil)
  :config (projectile-mode))
(use-package inf-ruby
  :ensure t
  :config (add-hook 'after-init-hook 'inf-ruby-switch-setup))
(use-package projectile-rails
  :ensure t
  :config (projectile-rails-mode))
(use-package rvm
  :ensure t
  :config (add-hook 'ruby-mode-hook (lambda ()
                                      rvm-activate-corresponding-ruby)))
(use-package go-mode
  :ensure t)
(use-package smex
  :ensure t
  :init (smex-initialize)
  :config (progn (global-set-key (kbd "M-x") 'smex)
                 (global-set-key (kbd "M-X") 'smex-major-mode-commands)))
(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode t))
(use-package auto-complete
  :ensure t
  :config (ac-config-default))
(use-package slime
  :ensure t
  :init (setq inferior-lisp-program "/usr/bin/clisp")
  :config (progn (require 'slime-autoloads)
                 (add-to-list 'slime-contribs 'slime-fancy)))
(use-package sudo-edit
  :ensure t
  :config (global-set-key (kbd "C-c C-r") 'sudo-edit))
(use-package ssh
  :ensure t
  :config (add-hook 'ssh-mode-hook
                  (lambda ()
                    (setq ssh-directory-tracking-mode t)
                    (shell-dirtrack-mode t)
                    (setq dirtrackp nil))))
(use-package magit
  :ensure t
  :config (progn (global-set-key (kbd "C-x g") 'magit-status)))
(setq doc-view-continuous t)
(global-auto-revert-mode t)
;; (provide '.emacs)
;;; .emacs ends here
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(windmove-default-keybindings)
