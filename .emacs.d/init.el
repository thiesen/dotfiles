(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("gnu" . "http://elpa.gnu.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    ido
    flx-ido
    flycheck
    projectile
    smex
    git-gutter
    auto-complete
    sudo-edit
    magit
    ag
    company
    cyberpunk-theme
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    ido-completing-read+
    rainbow-delimiters
    tagedit
    projectile-rails
    robe
    ruby-end
    rspec-mode))

(if (eq system-type 'darwin)
    (add-to-list 'my-packages 'exec-path-from-shell))

(when (memq window-system '(mac ns))
  (setq mac-option-key-is-meta nil)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

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
;;(load "ruby-config.el")
;;(load "go-config.el")
;;(load "python-config.el")
(load "lisp-config.el")
