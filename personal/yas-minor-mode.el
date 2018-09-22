;; yasnippets
(yas-global-mode 1)
(setq yas-buffer-local-condition 'always) ;; allow expansion in strings and comments
(setq yas-triggers-in-field t) ;; allow to trigger snippet from another snippet
;; unset defult yas-expand trigger keys
;; (define-key yas-minor-mode-map (kbd "C-<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "C-TAB") nil)
;; bind key to yas-expand when snippet available else keep original binding
;; (define-key yas-minor-mode-map (kbd("C-<tab")) yas-maybe-expand)
;; bind given key to yas-expand ONLY
;; (define-key yas-minor-mode-map (kbd("C-,tab>")) #'yas-expand)
