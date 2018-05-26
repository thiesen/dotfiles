(add-to-list 'default-frame-alist '(fullscreen . maximized))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(menu-bar-mode nil)
 '(package-archives
   (quote
    (("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/"))))
 '(package-selected-packages
   (quote
    (dockerfile-mode enh-ruby-mode docker xclip yaml-mode anaconda-mode pyenv-mode elpy handlebars-mode exec-path-from-shell bundler rspec-mode ein color-themes cider clojure-mode inf-ruby ag magit ssh projectile-rails evil sudo-edit sudo-save slime smartparens auto-complete git-gutter smex go-mode flx-ido projectile flycheck use-package color-theme)))
 '(projectile-globally-ignored-file-suffixes (quote ("~" "#")))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(same-window-buffer-names (quote ("*Directory*")))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#232629" :foreground "#eff0f1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 96 :width normal :family "Inconsolata")))))

;; hooks

;;; before save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; packages
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(use-package exec-path-from-shell)
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
(use-package enh-ruby-mode
  :ensure t
  :config (progn
            (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
            (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
            (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
            (add-to-list 'auto-mode-alist
                         '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))))
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
  :init (progn
          (load (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el"))
          (setf slime-lisp-implementations
                `((sbcl ("ros" "-Q" "-l" "~/.sbclrc" "-L" "sbcl" "run"))
                  (ccl  ("ros" "-Q" "-l" "~/.ccl-init.lisp" "-L" "ccl-bin" "run"))))
          (setf slime-default-lisp 'sbcl)
          (setq slime-net-coding-system 'utf-8-unix)
;          (setq inferior-lisp-program "ros -Q run")
          :config (progn (require 'slime-autoloads)
                         (add-to-list 'slime-contribs 'slime-fancy))))
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
(use-package rjsx-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode)))
(use-package yaml-mode
  :ensure t)
(use-package dockerfile-mode
  :ensure t)

(setq doc-view-continuous t)
(global-auto-revert-mode t)
;; (provide '.emacs)
;;; .emacs ends here
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(windmove-default-keybindings)
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(set-language-environment "UTF-8")
(setq ring-bell-function 'ignore)
(setq
 backup-by-copying t      ; don't clobber symlinks-
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
 auto-save-file-name-transforms
 `((".*" ,temporary-file-directory t))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups
(global-set-key (kbd "<RET>") 'newline-and-indent)

;; We tell slime to not load failed compiled code
(setq slime-load-failed-fasl 'never)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(load-theme 'misterioso)
(exec-path-from-shell-initialize)
(show-paren-mode t)
(setq x-select-enable-clipboard t
      x-select-enable-primary t)
