(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

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
    dumb-jump
    markdown-mode
    exec-path-from-shell))
(defvar web-pkgs
  '(web-mode
    rainbow-mode
    rainbow-delimiters))
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

(load "my-keybindings.el")
(load "remove-hooks.el")
(load "add-hooks.el")
(load "my-configs.el")
(load "utils.el")

(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "my-misc.el")
(load "personal.el")
(load "enabled-commands.el")

(load "org-mode-config.el")
(load "js-config.el")
(load "ruby-config.el")
(load "lisp-config.el")
(load "go-config.el")
(load "pdf-config.el")
(load "web-config.el")
(load "eshell-config.el")
(load "ssh-config.el")
(load "javascript-config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yaml-mode web-mode tagedit sudo-edit ssh smex ruby-end rspec-mode rbenv rainbow-mode rainbow-delimiters protobuf-mode projectile-rails persistent-scratch pdf-tools ox-gfm org-bullets ob-restclient ob-go nimbus-theme magit js2-mode ivy-rich gruvbox-theme gotest gorepl-mode go-guru go-eldoc git-link git-gutter flycheck-gometalinter enh-ruby-mode dumb-jump dockerfile-mode docker cyberpunk-theme counsel company-go bundler auto-complete arch-packer ansible ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
