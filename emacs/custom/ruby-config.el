(require 'rbenv)
(global-rbenv-mode)

(require 'projectile-rails)
(projectile-rails-global-mode)

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))


(setq ruby-deep-indent-paren nil)

(global-company-mode t)

(setq rspec-allow-multiple-compilation-buffers nil)
(setq compilation-scroll-output t)
(setq enh-ruby-add-encoding-comment-on-save nil)
(setq ruby-insert-encoding-magic-comment nil)
