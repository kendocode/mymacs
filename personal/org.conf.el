
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org.txt" . org-mode))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; Agenda
(define-key global-map "\C-ca" 'org-agenda)
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


(define-key global-map "\C-cl" 'org-store-link)

(setq org-log-done t)
