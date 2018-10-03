;;; 2-ross-functions.el.el --- summary -*- lexical-binding: t -*-

;; Author: ken
;; Maintainer: ken
;; Version: version
;; Package-Requires: (dependencies)
;; Homepage: homepage
;; Keywords: keywords

;;; Commentary:

;; commentary

;;; Code:

(defun zorch-line ()
  "Kill the line the point is on, from anywhere on that line."
  (interactive)
  (save-excursion
    (let ((start (line-beginning-position))
	  (end (if (= (line-end-position) (point-max))
		   (line-end-position)
		 (+ 1 (line-end-position)))))
      (kill-new (buffer-substring start end))
      (delete-region start end))
    ))
(defun copy-whole-buffer ()
  "Add a new entry to the kill ring containing the entire buffer."
  (interactive)
  (kill-new (buffer-substring (point-min) (point-max)))
  (message "Buffer %s copied to kill ring" (buffer-name)))

(defun roll-line-down ()
  "Move current line downward once."
  (interactive)
  (let (col (current-column))
    (forward-line)
    (transpose-lines 1)
    (forward-line -1)
    (forward-char col)))

(defun roll-line-up ()
  "Move current line upward once."
  (interactive)
  (let ((col (current-column)))
    (transpose-lines 1)
    (forward-line -2)
    (forward-char col)))

(defun kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (mapcar (lambda (b) (kill-buffer b)) (buffer-list))
  (delete-other-windows))

(provide '2-ross-functions)
;;; 2-ross-functions.el ends here
