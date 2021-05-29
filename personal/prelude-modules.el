;;; prelude-modules.el --- A listing of modules to load on startup
;;
;; Copyright © 2011-2021 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This file is just a list of Prelude modules to load on startup.
;; For convenience the modules are grouped in several categories.
;; The prelude-modules.el in the samples folder should be copied
;; to your personal folder and edited there.

;; Note that some modules can't be used together - e.g. you shouldn't
;; enable both prelude-ido and prelude-ivy, as they serve the same
;; purpose.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Restart Emacs or eval the requrire statement to pick up any changes here

;; Note that some modules can't be used together - e.g. you shouldn't
;; enable both prelude-ido and prelude-ivy, as they serve the same
;; purpose.

;; UTILITIES (mutually exclusive)
;; (require 'prelude-ido) ;; Supercharges Emacs completion for C-x C-f and more
;; (require 'prelude-ivy) ;; A mighty modern alternative to ido
;; (require 'prelude-selectrum) ;; A powerful, yet simple, alternative to ivy

;; I normally use Helm everywhere. Prelude defaults to Ivy now and also provides Ido and Selectrum
;; Helm can be required without enabling it everywhere. In that case use C-c h
;; to invoke Helm. Use C-c h C-h (help) to get a list of Helm key bindings.
;; You can reactivate Helm with (prelude-global-helm-global-mode-on)
(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-helm-everywhere) ;; Enable Helm everywhere

(require 'prelude-company)
(require 'prelude-key-chord) ;; Binds useful features to key combinations

;;; PROGRAMMING LANGUAGES SUPPORT
(require 'prelude-c)
;; (require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
(require 'prelude-css)
(require 'prelude-emacs-lisp)
;; (require 'prelude-erlang)
;; (require 'prelude-elixir)
;; (require 'prelude-go)
;; (require 'prelude-haskell)
(require 'prelude-js)
(require 'prelude-latex)
(require 'prelude-lisp)
(require 'prelude-lsp) ;; Base setup for the Language Server Protocol
;; (require 'prelude-lua)
;; (require 'prelude-ocaml)
;; (require 'prelude-org) ;; use my config at personal/1-org.conf.el
;; (require 'prelude-perl)
(require 'prelude-python)
(require 'prelude-ruby)
(require 'prelude-racket)
;; (require 'prelude-rust)
;; (require 'prelude-scala)
;; (require 'prelude-scheme)
(require 'prelude-shell)
(require 'prelude-scss)
;; (require 'prelude-ts)
(require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml) ;; unfortunately, till used
(require 'prelude-yaml)

;;; Misc
;; (require 'prelude-erc) ;; A popular Emacs IRC client (useful if you're still into Freenode).
;; (require 'prelude-evil) ;; Enable this module if you're fond of vim's keybindings.

(provide 'prelude-modules)
;;; prelude-modules.el ends here
