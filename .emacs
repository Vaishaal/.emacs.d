(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(set-keyboard-coding-system nil)
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/scala-mode2")
(add-to-list 'load-path "~/.emacs.d/undo-tree")
;; (add-to-list 'load-path "~/emacs.d/magit")

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")



(require 'evil)
(require 'scala-mode2)
(require 'undo-tree)
;; (require 'magit)


(defun load_conf (prompt)
  (load-file "~/.emacs")
  (kbd "C-g")
)

(global-undo-tree-mode)
(evil-mode 1)


(define-key evil-motion-state-map ";" 'evil-ex)
(define-key key-translation-map (kbd "C-c C-c") 'load_conf)

(load-theme 'solarized t)
(global-linum-mode 1)
(setq linum-format "%d ")
(menu-bar-mode -1)
