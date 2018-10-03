;;; yas.conf.el --- summary -*- lexical-binding: t -*-

;; Author: ken
;; Maintainer: ken
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords

;;; Commentary:

;; commentary

;;; Code:

;; set global with:
(require 'yasnippet)
(yas-global-mode 1)

;; OR enable per mode and buffer using as needed:
;; (yas-reload-all)
;; (add-hook 'program-mode-hook #'yas-minor-mode)

;; general config
(setq yas-triggers-in-field t) ;; allow to trigger snippet from another snippet
;;(setq yas-buffer-local-condition 'always) ;; allow expansion in strings and comments
;; unset defult yas-expand trigger keys
;; (define-key yas-minor-mode-map (kbd "C-<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "C-TAB") nil)
;; bind key to yas-expand when snippet available else keep original binding
;; (define-key yas-minor-mode-map (kbd("C-<tab")) yas-maybe-expand)
;; bind given key to yas-expand ONLY
;; (define-key yas-minor-mode-map (kbd("C-,tab>")) #'yas-expand)

(provide 'yas.conf)

;;; yas.conf.el ends here
