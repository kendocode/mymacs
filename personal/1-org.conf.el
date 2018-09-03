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


;; general
(add-to-list 'auto-mode-alist '("\\.org.txt" . org-mode)) ;; include for orgzly
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) ;; pretty bullets
(setq org-yank-adjusted-subtrees t) ;; yank the whole tree with its structure & adjust target
(setq org-footnote-auto-adjust t) ;; resort and renumber footnotes on new fn insertion

;; Current gtd setup based on https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html

;; agenda
(setq org-agenda-files (quote ("~/Sync/orgzly")))
(setq org-agenda-file-regexp "\.org\.?")

;;; captures
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates '(("t" "Todo" entry
                               (file+headline "~Sync/orgzly/inbox.org.txt" "Todo")x
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/Sync/orgzly/tickler.org.txt" "Tickler")
                               "* %i%? \n %U")
                              ("j" "Journal" entry
                               (file+olp+datetree "~/data/documents/journal.org")
                               "* %?\Entered on %U\n %i\n %a")))

;; refile targets
;; (setq org-refile-targets '(("~/Sync/orgzly/projects.org.txt" :maxlevel . 2)
;;                            ("~/data/documents/someday.org" :level . 1)
;;                            ("~/Sync/orgzly/tickler.org.txt" :level . 1)))
(setq org-refile-targets '((org-agenda-files :maxlevel . 2)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))


;; todo setup
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; archive setup
(setq org-archive-location "~/data/documents/archive.org::* From %s")

;;  LocalWords:  orgzly
