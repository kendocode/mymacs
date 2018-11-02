;;; Commentary:
;; add asdf to path until figure out how to make Emacs pick up full env
;;(setenv "PATH" (concat (getenv"PATH") ":/home/ken/.asdf/bin:/home/ken/.asdf/shims"))
;; solution = start Emacs server from shell after logged in, not as service

;;; Code:
(setq prelude-theme 'dracula-theme)

;; general settings and config
(setq select-enable-clipboard t)
(setq select-enable-primary nil)
(setq-default cursor-type 'bar)
(set-scroll-bar-mode nil)
;; update buffers when files change on disk (e.g. git checkout)
(global-auto-revert-mode t)

;; set my elpa mirror local repo to save good copies of all installed packages
(setq elpamr-default-output-directory "~/.kendotfiles/emacs/mymacs/personal/my_elpa")

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

;; set up my mode configurations
(lambda () (require '2-yas.conf))
(add-hook 'ruby-mode-hook (lambda () (require 'ruby-rails.conf)))
(add-hook 'js2-mode-hook (lambda () (require 'js.conf)))
(add-hook 'web-mode-hook (lambda () (require '2-web-mode.conf)))


;; my functions
(lambda () (require '2-ross-functions))
(lambda() (require '2-my-functions))

;; regex builder -- set to string not read
(setq reb-re-syntax 'string)

;; Save cursor position when reopening a file -- Thanks to Mike McFarland
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(provide 'emacs.conf)
;;; emacs.conf.el ends here
