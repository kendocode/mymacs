;; use robe for code completion, and projectile rails for navigation

(projectile-rails-global-mode)
(add-hook 'ruby-mode-hook 'robe-mode)
(global-company-mode t) ; allow intelligent code-completion
(push 'company-robe company-backends)

;; make adjustments so pry plays well with projectile-rails debugging
(add-hook 'after-init-hook 'inf-ruby-switch-setup) ; this allows use of binding.pry
;; was also necessary to modify pryrc to disable paging and turn off indent correction

;; ** Otherwise use prelude's stock ruby mode setup
