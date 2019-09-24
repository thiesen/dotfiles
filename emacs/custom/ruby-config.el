(require 'rbenv)
(global-rbenv-mode)

(add-hook 'compilation-filter-hook 'inf-ruby-auto-enter)

(require 'projectile-rails)
(projectile-rails-global-mode)

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)
(setq ruby-deep-indent-paren nil)

(global-company-mode t)

(add-hook 'after-init-hook 'inf-ruby-switch-setup)

(add-hook 'ruby-mode-hook
  (lambda () (hs-minor-mode)))

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[")) ; Block start
      ,(rx (or "}" "]" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

(setq rspec-allow-multiple-compilation-buffers nil)
(setq compilation-scroll-output t)
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq ruby-insert-encoding-magic-comment nil)
