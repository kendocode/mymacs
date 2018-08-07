;;My mods to prelude settings

;; required packages
(prelude-require-packages
 '(elpa-mirror ag xref-js2 js2-refactor robe markdown-mode csv-mode neotree yasnippet-snippets multi-term  key-chord yaml-mode web-mode geiser yari inf-ruby json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters coffee-mode company helm-ag helm-descbinds helm-projectile helm smex ido-completing-read+ flx-ido solarized-theme))

;; store backups in designated folder
(setq backup-directory-alist `((".*" . "~/.emacs.d/.backups")))

(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

;; ;;change key-chord to multichar jump instead of just one or two chrs
(key-chord-define-global "jj" 'avy-goto-char-timer)

;;I set my theme (usually solarized-dark) in /personal/preload
(disable-theme 'zenburn)

;;don't need reminders not to use arrows or disabling deletes
(setq prelude-guru nil) ;;has become ineffective -- guru mode still runs
(setq guru-mode nil) ;;this kills it

;; ;;don't usually need to see whitespace; toggle on when I do
(setq prelude-whitespace nil)

;; set my elpa mirror local repo to save good copies of all installed packages
(setq elpamr-default-output-directory "~/.dotfiles/emacs/personal/my_elpa")

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


;;;; mode configs

;; projectile rails 
(projectile-rails-global-mode)

;; javascript
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)
(define-key js-mode-map (kbd "M-.") nil) ;;js-mode binding conflicts with xref
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                           (setq js2-basic-offset 2)))

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

;; yasnippets
;;(yas-global-mode 1)
(setq yas-buffer-local-condition 'always) ;; allow expansion in strings and comments

;; regex builder -- set to string not read
(setq reb-re-syntax 'string)

;; Useful Functions

;; Save cursor position when reopening a file -- Thanks to Mike McFarland
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;;;;;;;;;;;;;;;;;;; Useful Functions With Thanks to Ross Andrews ;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
