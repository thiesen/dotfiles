(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(require 'projectile-rails)
(projectile-rails-global-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))
