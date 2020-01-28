;; docker
(global-set-key (kbd "C-c d") 'docker)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

;; ruby
(global-set-key (kbd "C-c r r") 'inf-ruby)
(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)

;; custom functions
(global-set-key (kbd "C-c e") 'custom/visit-emacs-config)
(global-set-key (kbd "C-c t") 'custom/visit-todo)
(global-set-key (kbd "C-c i") 'custom/visit-ideas)

;; move line up and down
(global-set-key [(control shift up)]  'custom/move-line-up)
(global-set-key [(control shift down)]  'custom/move-line-down)

;; toggle comment on line
(global-set-key (kbd "C-;") 'custom/toggle-comment-on-line)

;; set <RET> as newline and indent
(global-set-key (kbd "<RET>") 'newline-and-indent)

;; company mode complete function
(global-set-key (kbd "M-/") 'company-complete-common)

;; open eshell on the current directory
(global-set-key (kbd "C-!") 'custom/eshell-here)

;; list of buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; open directory in dired mode
(global-set-key (kbd "C-x C-d") 'dired)

;; use swiper to search
(global-set-key "\C-s" 'swiper)

;; search backward using regex
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; default isearch functions
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; counsel
(global-set-key (kbd "M-x") 'counsel-M-x)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
