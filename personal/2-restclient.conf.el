;;; restclient.conf.el --- summary -*- lexical-binding: t -*-

;; Author: ken
;; Maintainer: ken
;; Version: version
;; Package-Requires: (restclient)
;; Homepage: homepage
;; Keywords: keywords

;;; Commentary:

;; commentary

;;; Code:

(defun my-restclient-mode-hook ()
  (add-to-list 'company-backends 'company-restclient)
  (add-hook 'restclient-mode-hook 'my-restclient-mode-hook))

(provide 'restclient)

;;; restclient.conf.el ends here
