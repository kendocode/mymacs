;;; Commentary:

;; Copy sample of prelude-modules and enable these at least:
;;   prelude-helm-everywhere
;;   prelude-key-chord (** modify here in personal to use avy-goto-char-timer to jump like search)

;; 5/16/17 -- copied code for org-download directly from github because MELPA not working
;; required package "org-download" to get inline pics; set its config
;;(prelude-require-package 'org-download)

;; also, check http://pragmaticemacs.com/installing-and-setting-up-emacs/


;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) ;;not same as melpa-stable
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; set my elpa mirror local repo to save good copies of all installed packages
(setq elpamr-default-output-directory "~/.dotfiles/lib/my_elpa")


;; general settings and config
(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq-default cursor-type 'bar)
;; Q:what the hell does it take to get rid of scroll bars by default?????
;; yipee!! finally found by doing helm-locate-library, found scroll-bar.el.gz
;; where this is defined at line 110. Can be set nil, left, or right.
(set-scroll-bar-mode nil)


;;my global keys
(global-set-key [f8] 'neotree-toggle)
;; (define-key global-map "\C-cc" 'org-capture)
(global-set-key [f9] 'view-buffer-other-frame)
(global-set-key [f5] 'yas-insert-snippet)

;;set powerline theme for smart mode line
;;(setq sml/theme 'powerline)
;;(sml/setup)

;; try using gdrive to open and edit google docs using emacs
;; not working so far -- boo hoo
(defvar gdocs-folder-id "18I53Fh2ALanl-gxVillHnLUE5-EzNiSi"
  "location for storing org to gdocs exported files, use 'gdrive list --query \" name contains '<foldername>'\" to find the id")
(defun gdoc-export-buffer ()
  "Export current buffer as google doc to folder identified by gdocs-folder-id"
  (interactive)
  (shell-command
   (format "gdrive import --mimetype text/plain --parent %s --file %s"
           gdocs-folder-id buffer-file-name)))
(defun gdoc-import-buffer (doc)
  "Import a file in gdocs-folder-id into current buffer"
  (interactive 
   (list
    (completing-read "Choose one: "
                     (split-string
                      (shell-command-to-string
                       (format "gdrive list -q \"'%s' in parents\"" gdocs-folder-id)) "\n"))))
  (insert (replace-regexp-in-string (string ?\C-m) (string ?\C-j) (shell-command-to-string
                                                                   (format "gdrive download -s --format txt --id %s" (car (split-string doc " ")))))))

;; integrate browser edit-server with gmail
(autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "edit-server-htmlize" t)
(autoload 'edit-server-maybe-htmlize-buffer   "edit-server-htmlize" "edit-server-htmlize" t)
(add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
(add-hook 'edit-server-done-hook  'edit-server-maybe-htmlize-buffer)

;; projectile rails 
(projectile-rails-global-mode)


;; javascript stuff
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
(define-key js-mode-map (kbd "M-.") nil) ;;js-mode binding conflicts with xref
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                           (setq js2-basic-offset 2)))



;; org-download config
;; to set download image dir per buffer use:
;;     -*- mode: Org; org-download-image-dir: "~/Pictures/foo"; -*-
;; to set heading-lvl appended to dir on per buffer use:
;;     -*- mode: Org; org-download-image-dir: "~/Pictures/foo"; -*-
;; to set dir globally:
(setq-default org-download-image-dir "~/Org/Downloaded-Images")
(setq org-default-notes-file "~/Org/captures.org")
;; allow org-mode to use tab key its way and override yas
(add-hook 'org-mode-hook
          (lambda ()
            (setq-local yas/trigger-key [tab])
            (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))


;; set multi-term and helm-mt to use my zsh
(setq multi-term-program "/usr/bin/zsh")
;;disable yasnippets in terminal buffers to allow zsh tab completion
(add-hook 'term-mode-hook (lambda()
                            (yas-minor-mode -1)))

;;web-mode
(defun personal-web-mode-hooks ()
  "My hooks for Web mode."
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook 'personal-web-mode-hooks)

;;yasnippets
;;(yas-global-mode 1)
(setq yas-buffer-local-condition 'always) ;; allow expansion in strings and comments


;; set regex builder to string not read
(setq reb-re-syntax 'string)


;; pull into separate required package sometime for practice....
;;;;;;;;;;;;;;;;;;; Thanks to Ross ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun zorch-line ()
  "Kill the line the point is on, from anywhere on that line"
  (interactive)
  (save-excursion
    (let ((start (line-beginning-position))
	  (end (if (= (line-end-position) (point-max))
		   (line-end-position)
		 (+ 1 (line-end-position)))))
      (kill-new (buffer-substring start end))
      (delete-region start end))
    ))

;; use crux version of this instead of Ross's
;; because it also handles regions and takes arg for repeats
;; EDIT: it also already was included with prelude 'duh', I never knew...

;; (defun duplicate-line ()
;;   "Duplicate the line the point is on, moving the point to the duplicate"
;;   (interactive)
;;   (save-excursion
;;     (kill-new (buffer-substring (line-beginning-position) (line-end-position)))
;;     (end-of-line)
;;     (newline)
;;     (yank)
;;     (rotate-yank-pointer 1)
;;     )
;;   (forward-line 1) ;; compile warning said next-line for interactive use only so changed this
;;   )

(defun copy-whole-buffer ()
  "Add a new entry to the kill ring containing the entire buffer"
  (interactive)
  (kill-new (buffer-substring (point-min) (point-max)))
  (message "Buffer %s copied to kill ring" (buffer-name)))

(defun roll-line-down ()
  "Move current line downward once."
  (interactive)
  (let (col (current-column))
    (forward-line)
    (transpose-lines 1)
    (forward-line -1)
    (forward-char col)))

(defun roll-line-up ()
  "Move current line upward once."
  (interactive)
  (let ((col (current-column)))
    (transpose-lines 1)
    (forward-line -2)
    (forward-char col)))

(defun kill-all-buffers ()
  (interactive)
  (mapcar (lambda (b) (kill-buffer b)) (buffer-list))
  (delete-other-windows))

;;;;;;;;;;;;;;; end of Rossians ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
