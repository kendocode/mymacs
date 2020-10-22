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
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))) ;; pretty bullets
(setq org-yank-adjusted-subtrees t) ;; yank the whole tree with its structure & adjust target
(setq org-footnote-auto-adjust t) ;; resort and renumber footnotes on new fn insertion
;; add org-babel languages to enable code execution in org mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (restclient . t)
   (makefile . t)
   (plantuml . t)
   (ruby . t)
   (sed . t)
   (shell . t)))

;; WIP
;; Current gtd setup based on https://emacs.cafe/emacs/orgmode/gtd/2017/06/30/orgmode-gtd.html
;; also slowly taking in http://doc.norang.ca/org-mode.html#OrgFiles

;; agenda
(setq org-agenda-files '("~/sync-org/inbox.org"
                         "~/sync-org/projects.org"
                         "~/sync-org/tickler.org"))


;;; captures
(global-set-key "\C-cc" 'org-capture)
(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/sync-org/inbox.org" "Todo")
                               "* TODO %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/sync-org/tickler.org" "Tickler")
                               "* %i%? \n %U")
                              ("j" "Journal" entry
                               (file+olp+datetree "~/sync-org/journal.org")
                               "* %?\nEntered on %U\n %i\n %a")))

;; refiling
(setq org-refile-targets '(("~/sync-org/projects.org" :maxlevel . 3)
                           ("~/sync-org/someday.org" :level . 1)
                           ("~/sync-org/tickler.org" :level . 2)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))


;; todo setup
(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;; archive setup
(setq org-archive-location "~/sync-org/archive.org::* From %s")
