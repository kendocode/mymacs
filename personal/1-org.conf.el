;; ;;;;;;;; code provided by prelude-org.el ;;;;;;;;;;;;;;;;;;;;;;
;; (add-to-list 'auto-mode-alist '("\\.org\\’" . org-mode))
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)
;; (setq org-log-done t)

;; (defun prelude-org-mode-defaults ()
;;   (let ((oldmap (cdr (assoc 'prelude-mode minor-mode-map-alist)))
;;         (newmap (make-sparse-keymap)))
;;     (set-keymap-parent newmap oldmap)
;;     (define-key newmap (kbd "C-c +") nil)
;;     (define-key newmap (kbd "C-c -") nil)
;;     (define-key newmap (kbd "C-a") nil)
;;     (make-local-variable 'minor-mode-overriding-map-alist)
;;     (push `(prelude-mode . ,newmap) minor-mode-overriding-map-alist))
;; )

;; (setq prelude-org-mode-hook 'prelude-org-mode-defaults)

;; (add-hook 'org-mode-hook (lambda () (run-hooks 'prelude-org-mode-hook)))

;; (provide 'prelude-org)
;;;;;;;;;;;; end prelude provided code ;;;;;;;;;;;;;;;;;;;;;;
;;; prelude-org.el ends here

;;;;;;;;;;;;;; my org config ;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.org.txt" . org-mode))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-yank-adjusted-subtrees t)
(setq org-footnote-auto-adjust t)

;; Current gtd setup based on https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html

;; Agenda
(setq org-agenda-files (quote ("~/Dropbox/orgzly/inbox.org.txt"
                               "~/Dropbox/orgzly/projects.org.txt"
                               "~/Dropbox/orgzly/tickler.org.txt"
                               "~/Dropbox/orgzly/todo.org.txt")))

;;; captures
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~Dropbox/orgzly/inbox.org.txt" "Inbox")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Dropbox/orgzly/tickler.org.txt" "Tickler")
                               "* %i%? \n %U")
                              ("j" "Journal" entry
                               (file+olp+datetree "~/data/documents/journal.org")
                               "* %?\Entered on %U\n %i\n %a")))

;; refile targets
(setq org-refile-targets '(("~/Dropbox/orgzly/projects.org.txt" :maxlevel . 3)
                           ("~/data/documents/someday.org" :level . 1)
                           ("~/Dropbox/orgzly/tickler.org.txt" :maxlevel . 2)))
(setq org-refile-allow-creating-parent-nodes t)

;; todo setup
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;;  LocalWords:  orgzly
