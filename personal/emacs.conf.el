;; general settings and config
(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq-default cursor-type 'bar)
(set-scroll-bar-mode nil)

;; set my elpa mirror local repo to save good copies of all installed packages
(setq elpamr-default-output-directory "~/.emacs.d/personal/my-elpa")

;; global keys
(global-set-key [f8] 'neotree-toggle)
(global-set-key [f9] 'view-buffer-other-frame)
(global-set-key [f5] 'yas-insert-snippet)
(global-set-key (kbd "C-\"") 'insert-pair) ;; wrap region in ""
(global-set-key (kbd "C-'") 'insert-pair) ;; wrap region in ''
;; note using prefix C-u with change-* means copy vs kill
(global-set-key (kbd "M-s-i") 'change-inner) ;; kill everything in delimiter
(global-set-key (kbd "M-s-o") 'change-outer) ;; kill everything up to and including delimiter
(global-set-key (kbd "M-s-<up>") 'roll-line-up)
(global-set-key (kbd "M-s-<down>") 'roll-line-down)

;; TODO work on my function wrap-region to take argument


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

;; Save cursor position when reopening a file -- Thanks to Mike McFarland
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;;;;;;;;;;;;;;;; My functions ;;;;;;;;;;;;;;;
(defun wrap-region ()
  (interactive)
  (if (region-active-p)
      (insert-pair 1 ?{ ?})
    (insert "{}")
    (backward-char)))



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
