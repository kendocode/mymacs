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

;; Agenda
(setq org-agenda-files (quote ("~/Dropbox/orgzly/inbox.org.txt"
                               "~/Dropbox/orgzly/gtd.org"
                               "~/Dropbox/orgzly/tickler.org")))

;;; captures
(define-key global-map "\C-cc" 'org-capture)
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~Dropbox/orgzly/inbox.org" "Inbox")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Dropbox/orgzly/tickler.org" "Tickler")
                               "* %i%? \n %U")
                              ("j" "Journal" entry
                               (file+olp+datetree "~/data/documents/journal.org")
                               "* %?\Entered on %U\n %i\n %a")))
