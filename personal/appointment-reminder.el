(require 'appt)
(appt-activate t)

(setq appt-message-warning-time 5) ; Show notification 5 minutes before event
(setq appt-display-interval appt-message-warning-time) ; Disable multiple reminders
(setq appt-display-mode-line nil)

; Use appointment data from org-mode
(defun my-org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))

; Update alarms when...
; (1) ... Starting Emacs
(my-org-agenda-to-appt)

; (2) ... Everyday at 12:05am (useful in case you keep Emacs always on)
(run-at-time "12:05am" (* 24 3600) 'my-org-agenda-to-appt)

; (3) ... When inbox is saved
(add-hook 'after-save-hook
          '(lambda ()
             (if (string= (buffer-file-name) (concat (getenv "HOME") "/Dropbox/orgzly/inbox.org.txt"))
                 (my-org-agenda-to-appt))))

; Display appointments as a window manager notification
(setq appt-disp-window-function 'my-appt-display)
(setq appt-delete-window-function (lambda () t))

(setq my-appt-notification-app (concat (getenv "HOME") "/bin/scripts/appt-notification"))

(defun my-appt-display (min-to-app new-time msg)
  (if (atom min-to-app)
      (start-process "my-appt-notification-app" nil my-appt-notification-app min-to-app msg)
    
