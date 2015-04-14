(set-keyboard-coding-system nil)
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(define-key key-translation-map (kbd ":") (kbd ";"))
(define-key key-translation-map (kbd ";") (kbd ":"))

(load-theme 'wombat)
(global-linum-mode 1)
(setq linum-format "%d ")
(menu-bar-mode -1)
