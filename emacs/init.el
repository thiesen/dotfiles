(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; define package collections

(defvar ruby-pkgs
  '(projectile-rails
    ruby-end
    rspec-mode
    enh-ruby-mode
    bundler
    rbenv))
(defvar nav-pkgs
  '(ivy
    counsel
    projectile
    smex
    ag
    ivy-rich))
(defvar misc-pkgs
  '(flycheck
    auto-complete
    sudo-edit
    company
    cyberpunk-theme
    gruvbox-theme
    nimbus-theme
    yaml-mode
    pdf-tools
    ansible
    restclient
    org-bullets
    flyspell
    persistent-scratch
    ob-restclient
    ssh
    dumb-jump))
(defvar web-pkgs
  '(web-mode
    rainbow-mode
    rainbow-delimiters
    tagedit))
(defvar go-pkgs
  '(go-mode
    go-guru
    flycheck-gometalinter
    company-go
    go-eldoc
    ob-go
    protobuf-mode
    gorepl-mode
    gotest))
(defvar docker-pkgs
  '(docker
    dockerfile-mode
    docker-tramp))
(defvar git-pkgs
  '(magit
    git-gutter
    git-link
    ox-gfm))
(defvar javascript-pkgs
  '(js2-mode))
(defvar pkg-list
  '(ruby-pkgs
    nav-pkgs
    misc-pkgs
    go-pkgs
    docker-pkgs
    web-pkgs
    git-pkgs
    javascript-pkgs))
;; create a concatenated list with the values of the collections
(defvar my-packages
  (mapcan #'(lambda (var-name) (symbol-value var-name)) pkg-list))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))
;; custom configs
(add-to-list 'load-path "~/.emacs.d/custom")

(load "utils.el")
(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
(load "personal.el")
(load "enabled-commands.el")

(load "org-mode-config.el")
(load "js-config.el")
(load "magit-config.el")
(load "ruby-config.el")
(load "lisp-config.el")
(load "go-config.el")
(load "pdf-config.el")
(load "docker-config.el")
(load "web-config.el")
(load "eshell-config.el")
(load "ssh-config.el")
(load "flyspell-config.el")
(load "javascript-config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (arch-packer dumb-jump ob-restclient redis slack gorepl-mode yafolding terraform-mode sr-speedbar nimbus-theme csv-mode persistent-scratch racket-mode geiser foreign-regexp ghub+ yaml-mode web-mode tagedit sudo-edit ssh smex ruby-end rspec-mode restclient rainbow-mode rainbow-delimiters projectile-rails pdf-tools paredit ox-gfm org-bullets ob-go magit ido-completing-read+ gruvbox-theme go-guru go-eldoc git-link git-gutter flycheck-gometalinter flx-ido exec-path-from-shell enh-ruby-mode dockerfile-mode cyberpunk-theme counsel company-go clojure-mode-extra-font-locking cider auto-complete ansible ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
