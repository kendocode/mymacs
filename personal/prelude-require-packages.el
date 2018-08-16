;; required packages
;; for some reason need to run this with shell command
;; emacs $HOME/.emacs.d/personal/prelude-require-packages.el --eval '(eval-buffer)' to ensure loading
;; need to check why buffer not evaluated on startup

(prelude-require-packages
 '(writegood-mode elpa-mirror ag xref-js2 js2-refactor robe projectile-rails markdown-mode csv-mode neotree yasnippet-snippets multi-term  key-chord yaml-mode web-mode geiser yari inf-ruby json-mode js2-mode rainbow-mode elisp-slime-nav rainbow-delimiters coffee-mode company helm-ag helm-descbinds helm-projectile helm smex ido-completing-read+ flx-ido solarized-theme))
