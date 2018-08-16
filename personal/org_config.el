;; finally gonna learn Org Mode

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook (lambda () org-bullets-mode 1))
