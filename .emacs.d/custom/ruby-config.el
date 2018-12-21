(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(require 'projectile-rails)
(projectile-rails-global-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|jbuilder\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

(remove-hook 'enh-ruby-mode-hook 'erm-define-faces)
