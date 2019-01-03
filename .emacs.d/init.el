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
    robe
    ruby-end
    rspec-mode
    enh-ruby-mode))
(defvar clojure-pkgs
  '(clojure-mode
    clojure-mode-extra-font-locking
    cider))
(defvar nav-pkgs
  '(ido
    flx-ido
    projectile
    smex
    ag))
(defvar misc-pkgs
  '(flycheck
    git-gutter
    auto-complete
    sudo-edit
    magit
    company
    cyberpunk-theme
    gruvbox-theme
    ido-completing-read+
    yaml-mode
    pdf-tools
    ansible))
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
    ob-go))
;; add defined collections to pkg list
(defvar docker-pkgs
  '(docker
    dockerfile-mode
    docker-tramp))
(defvar pkg-list
  '(ruby-pkgs
    clojure-pkgs
    nav-pkgs
    misc-pkgs
    go-pkgs
    docker-pkgs
    web-pkgs))
;; create a concatenated list with the values of the collections
(defvar my-packages
  (mapcan #'(lambda (var-name) (symbol-value var-name)) pkg-list))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/custom")

(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")

(load "org-mode-config.el")
(load "clojure-config.el")
(load "js-config.el")
(load "magit-config.el")
(load "ruby-config.el")
(load "lisp-config.el")
(load "ansible-config.el")
(load "go-config.el")
(load "pdf-config.el")
(load "docker-config.el")
(load "web-config.el")
;;(load "python-config.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a5956ec25b719bf325e847864e16578c61d8af3e8a3d95f60f9040d02497e408" "f27c3fcfb19bf38892bc6e72d0046af7a1ded81f54435f9d4d09b3bff9c52fc1" default)))
 '(package-selected-packages
   (quote
    (gruvbox-theme ob-go web-mode highlight-indentation dr-racket-like-unicode company-go enh-ruby-mode yaml-mode tagedit sudo-edit smex ruby-end rspec-mode robe rainbow-delimiters projectile-rails magit ido-completing-read+ git-gutter flycheck flx-ido exec-path-from-shell cyberpunk-theme company clojure-mode-extra-font-locking cider auto-complete ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
