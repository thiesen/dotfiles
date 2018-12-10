(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)

(require 'projectile-rails)
(projectile-rails-mode)

(require 'rbenv)
(global-rbenv-mode)
