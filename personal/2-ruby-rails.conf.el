;;;; prelude module code included with module
;; (require 'prelude-programming)

;; (prelude-require-packages '(inf-ruby yari))

;; ;; We never want to edit Rubinius bytecode
;; (add-to-list 'completion-ignored-extensions ".rbc")

;; (define-key 'help-command (kbd "R") 'yari)

;; (eval-after-load 'ruby-mode
;;   '(progn
;;      (defun prelude-ruby-mode-defaults ()
;;        (inf-ruby-minor-mode +1)
;;        ;; CamelCase aware editing operations
;;        (subword-mode +1))

;;      (setq prelude-ruby-mode-hook 'prelude-ruby-mode-defaults)

;;      (add-hook 'ruby-mode-hook (lambda ()
;;                                  (run-hooks 'prelude-ruby-mode-hook)))))

;; (provide 'prelude-ruby)
;; ;;; prelude-ruby.el ends here

;;; *** My Config ***
;;; Code:

;; set ctags to auto update
(add-hook 'ruby-mode-hook  'turn-on-ctags-auto-update-mode)

;; I like Robe for jumping to code features
(add-hook 'ruby-mode-hook 'robe-mode)
;; use company as code-completion backend for Robe
(global-company-mode t)
(push 'company-robe company-backends)

;; Projectile rails is great for project navigation
(projectile-rails-global-mode)

; Cool for little stuff and presentations
;; shows output alongside the code in same buffer
(add-hook 'ruby-mode-hook 'seeing-is-believing)
(require 'seeing-is-believing)

;; testing rspec-mode for tests now, supposed to add its own hook
;; keeping test conf below just in case
;; ;; run tests in emacs
;; (add-hook 'ruby-mode-hook 'ruby-test-mode)
;; (add-hook 'compilation-finish-functions
;;           (lambda (buf strg)
;;             (switch-to-buffer-other-window "*compilation*")
;;             (read-only-mode)
;;             (goto-char (point-max))
;;             (local-set-key (kbd "q")
;;                            (lambda () (interactive) (quit-restore-window)))))

;; use yafolding instead of hide-show -- simpler and works for me for now
(require 'yafolding)
(add-hook 'ruby-mode-hook 'yafolding-mode)
(global-set-key (kbd "M-RET") 'yafolding-toggle-element)

;; allow binding.pry to use inf-ruby buffer
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
(provide 'ruby-rails.conf)
;;; ruby-rails.conf ends here
