;;; 2-js.conf.el --- summary -*- lexical-binding: t -*-

;; Author: ken
;; Maintainer: ken
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords


;; This file is not part of GNU Emacs

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; commentary

;;; Code:

;; tide mode
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))


;; standard js setup
(add-hook 'js2-mode-hook (lambda ()
                           (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)
                           (add-hook 'js2-mode-hook #'js2-refactor-mode)
                           (add-hook 'js2-mode-hook #'setup-tide-mode)
                           (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)
                           (js2r-add-keybindings-with-prefix "C-c C-r")
                           (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
                           ;;(define-key js-mode-map (kbd "M-.") nil) ;;js2 conflicts with xref binds
                           (setq js2-basic-offset 2)
                           (setq js2-strict-missing-semi-warning nil))) ;; ES6 not as picky about semis

;; rjsx setup for react
;; rjsx should automatically launch for jsx extensions anywhere
(add-to-list 'auto-mode-alist '("components\/.*\.js\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("containers\/.*\.js\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("Components\/.*\.js\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("Containers\/.*\.js\'" . rjsx-mode))

(add-hook 'rjsx-mode-hook
          (lambda ()
            (add-hook 'rjsx-mode-hook #'setup-tide-mode)
            (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)
            (setq indent-tabs-mode nil) ;; use spaces, duh
            (setq js-indent-level 2))) ;; default is 4 -- adjust per team styles



;;(provide '2-js.conf.el)

;;; 2-js.conf.el ends here
