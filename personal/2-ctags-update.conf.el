;;; 2-ctags-update.conf.el.el --- summary -*- lexical-binding: t -*-

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
;; 
;; commentary

;;; Code:


(provide '2-ctags-update.conf.el)

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
