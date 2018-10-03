;;; 2-rspec-mode.conf.el.el --- summary -*- lexical-binding: t -*-

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
;; From https://github.com/pezra/rspec-mode

;; commentary

;;; Code:

;; per docs should be started when ruby mode started so don't need to add the hook

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(provide '2-rspec-mode.conf.el)

;;; 2-rspec-mode.conf.el ends here
