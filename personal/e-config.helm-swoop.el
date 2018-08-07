;; commented out defs for helm-swoop-map because kept getting error saying
;; variable value was void.

;;config for helm-swoop
;; from https://github.com/ShingoFukuyama/helm-swoop
;; nope, with-eval-after-load did not help, or same with 'helm-swoop
(with-eval-after-load
    (global-set-key (kbd "M-i") 'helm-swoop)
    (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
    (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
    (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
    ;; When doing isearch, hand the word over to helm-swoop
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    ;; From helm-swoop to helm-multi-swoop-all
    ;;(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
    ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
    ;;(define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

    ;; Move up and down like isearch
    ;;(define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
    ;;(define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
    ;;(define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
    ;;(define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

    ;; ;; Save buffer when helm-multi-swoop-edit complete
    ;; (setq helm-multi-swoop-edit-save t)

    ;; ;; If this value is t, split window inside the current window
    ;; (setq helm-swoop-split-with-multiple-windows nil)

    ;; ;; Split direcion. 'split-window-vertically or 'split-window-horizontally
    ;; (setq helm-swoop-split-direction 'split-window-vertically)

    ;; ;; If nil, you can slightly boost invoke speed in exchange for text color
    ;; (setq helm-swoop-speed-or-color nil)

    ;; ;; ;; Go to the opposite side of line from the end or beginning of line
    ;; (setq helm-swoop-move-to-line-cycle t)

    ;; ;; Optional face for line numbers
    ;; ;; Face name is `helm-swoop-line-number-face`
    ;; (setq helm-swoop-use-line-number-face t)

    ;; ;; If you prefer fuzzy matching
    ;; (setq helm-swoop-use-fuzzy-match t)


    ;; By default, helm-swoop uses search query at the cursor.
    ;; You can configure this behavior by setting helm-swoop-pre-input-function on your own.

    ;; ;; Use search query at the cursor  (default)
    ;; (setq helm-swoop-pre-input-function
    ;;       (lambda () (thing-at-point 'symbol)))

    ;; ;; Disable pre-input
    ;; (setq helm-swoop-pre-input-function
    ;;       (lambda () ""))
    ;; ;; Or, just use M-x helm-swoop-without-pre-input

    ;; ;; Match only for symbol
    ;; (setq helm-swoop-pre-input-function
    ;;       (lambda () (format "\\_<%s\\_> " (thing-at-point 'symbol))))

    ;; ;; Always use the previous search for helm. Remember C-<backspace> will delete entire line
    ;; (setq helm-swoop-pre-input-function
    ;;       (lambda () (if (boundp 'helm-swoop-pattern)
    ;;                      helm-swoop-pattern "")))

    ;; ;; If there is no symbol at the cursor, use the last used words instead.
    ;; (setq helm-swoop-pre-input-function
    ;;       (lambda ()
    ;;         (let (($pre-input (thing-at-point 'symbol)))
    ;;           (if (eq (length $pre-input) 0)
    ;;               helm-swoop-pattern ;; this variable keeps the last used words
    ;;             $pre-input))))
)
