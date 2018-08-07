;;My mods to prelude settings

;; ;;change key-chord to multichar jump instead of just one or two chrs
(key-chord-define-global "jj" 'avy-goto-char-timer)

;;I set my theme (usually solarized-dark) in /personal/preload
(disable-theme 'zenburn)

;;don't need reminders not to use arrows or disabling deletes
(setq prelude-guru nil) ;;has become ineffective -- guru mode still runs
(setq guru-mode nil) ;;this kills it

;; ;;don't usually need to see whitespace; toggle on when I do
(setq prelude-whitespace nil)
