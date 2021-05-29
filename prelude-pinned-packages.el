;; pin org package to that from Org' own repo
(add-to-list 'package-archives
             '("org-elpa" . "https://orgmode.org/elpa/") t)

(setq package-pinned-packages
      '(
        (org-plus-contrib . "org-elpa")
        ))
