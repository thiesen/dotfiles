(add-to-list 'default-frame-alist '(fullscreen . maximized))

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(column-number-mode t)
(visual-line-mode t)

;;(load-theme 'cyberpunk t)
(load-theme 'gruvbox-dark-hard t)

(set-face-attribute 'default nil :height 102 :family "Inconsolata")

(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t)

(setq-default frame-title-format "%b %f")

(setq ring-bell-function 'ignore)

(setq-default fill-column 80)
