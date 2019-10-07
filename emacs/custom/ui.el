(add-to-list 'default-frame-alist '(fullscreen . maximized))

(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(column-number-mode t)
(visual-line-mode t)

(load-theme 'nimbus t)

(setq-default frame-title-format "%b %f")

(setq-default fill-column 80)

(global-prettify-symbols-mode 1)

(set-window-scroll-bars (minibuffer-window) nil nil)

(define-key global-map (kbd "C-)") 'custom/reset-font-size)
(define-key global-map (kbd "C-+") 'custom/increase-font-size)
(define-key global-map (kbd "C-=") 'custom/increase-font-size)
(define-key global-map (kbd "C-_") 'custom/decrease-font-size)
(define-key global-map (kbd "C--") 'custom/decrease-font-size)

(custom/reset-font-size)
