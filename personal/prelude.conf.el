;; I set my own theme (usually solarized-dark) in /personal/preload
;; (disable-theme 'zenburn) ;; zenburn ok for terminal on server 
;; don't need reminders not to use arrows or disabling deletes
(setq prelude-guru nil)
(setq guru-mode nil)
;; don't usually need to see whitespace; toggle on when I do
(setq prelude-whitespace nil)
;;change key-chord to multichar jump instead of just one or two chrs
(key-chord-define-global "jj" 'avy-goto-char-timer)

