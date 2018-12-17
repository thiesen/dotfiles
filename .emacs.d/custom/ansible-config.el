(add-hook 'yaml-mode-hook '(lambda () (ansible t)))
(global-set-key (kbd "C-c b") 'ansible::decrypt-buffer)
(global-set-key (kbd "C-c g") 'ansible::encrypt-buffer)
