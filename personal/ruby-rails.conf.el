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

;;;;;;;;;;;;;; My config ;;;;;;;;;;;;;;;;;;;;;;;

;; I like robe for code completion, and projectile rails for navigation
(projectile-rails-global-mode)
(add-hook 'ruby-mode-hook 'robe-mode)

;; let me see output right along with code
(add-hook 'ruby-mode-hook 'seeing-is-believing)
(require 'seeing-is-believing)
;; prefix not working, default or setting. Don't know why.
;; never know why, that's the glory of emacs
;;(setq seeing-is-believing-prefix "C-c ?")


;; run tests in emacs
(add-hook 'ruby-mode-hook 'ruby-test-mode)
(add-hook 'compilation-finish-functions
          (lambda (buf strg)
            (switch-to-buffer-other-window "*compilation*")
            (read-only-mode)
            (goto-char (point-max))
            (local-set-key (kbd "q")
                           (lambda () (interactive) (quit-restore-window)))))

;; allow intelligent code-completion
(global-company-mode t)
(push 'company-robe company-backends)

;; testing yafolding instead of hide-show
(require 'yafolding)
(add-hook 'ruby-mode-hook 'yafolding-mode)
(global-set-key (kbd "M-RET") 'yafolding-toggle-element)



;; do code folding with hide-show
;; WIP -- not working
;; (add-hook 'ruby-mode-hook
;;           (lambda () (hs-minor-mode)))
;; (eval-after-load "hideshow"
;;   '(add-to-list 'hs-special-modes-alist
;;                 '(ruby-mode
;;                   ,(rx (or "def" "class" "module" "do")) ; block starters
;;                   ,(rx (or "end")) ; block end
;;                   ruby-forward-sexp nil)))
;; (global-set-key (kbd "C-c h") 'hs-hide-block-at-point)
;; (global-set-key (kbd "C-c s") 'hs-show-block-at-point)

;; make adjustments so pry plays well with projectile-rails debugging
;; was also necessary to modify pryrc to disable paging and turn off indent correction
(add-hook 'after-init-hook 'inf-ruby-switch-setup) ; this allows use of binding.pry
