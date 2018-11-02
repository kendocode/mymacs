;;; 2-ctags-update.conf.el.el --- summary -*- lexical-binding: t -*-

;; Author: ken
;; Maintainer: ken
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords

;;; Commentary:
;; Docs:  https://github.com/jixiuf/ctags-update

;; usage:
;;; 2-ctags-update.conf.el ends here
;; (ctags-global-auto-update-mode)
;; (setq ctags-update-prompt-create-tags nil);you need manually create TAGS in your project 

;; ;; or only turn it on for some special mode

;; (autoload 'turn-on-ctags-auto-update-mode "ctags-update" "turn on 'ctags-auto-update-mode'." t)
;; (add-hook 'c-mode-common-hook  'turn-on-ctags-auto-update-mode)
;; ...
;; (add-hook 'emacs-lisp-mode-hook  'turn-on-ctags-auto-update-mode)




;;                                         ;if you want to update (create) TAGS manually
;; (autoload 'ctags-update "ctags-update" "update TAGS using ctags" t)
;; (global-set-key "\C-cE" 'ctags-update)


;; commentary

;;; Code:

;; (ctags-global-auto-update-mode)
;; (setq ctags-update-prompt-create-tags nil);you need manually create TAGS in your project
;; use shell command: ctags -R -r <dir>

(provide '2-ctags-update.conf.el)

