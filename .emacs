(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
(set-keyboard-coding-system nil)
(add-to-list 'load-path "~/.emacs.d/evil")
(add-to-list 'load-path "~/.emacs.d/evil-leader")
(add-to-list 'load-path "~/.emacs.d/scala-mode2")
(add-to-list 'load-path "~/.emacs.d/undo-tree")
(add-to-list 'load-path "~/.emacs.d/projectile")
(add-to-list 'load-path "~/.emacs.d/dash.el")
(add-to-list 'load-path "~/.emacs.d/whitespace")

(add-to-list 'load-path "~/.emacs.d/site-lisp/magit")
(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")



(require 'evil)
(require 'evil-leader)
(require 'scala-mode2)
(require 'undo-tree)
(require 'ido)
(require 'dash)
(require 'projectile)
(require 'whitespace)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(projectile-global-mode)
(require 'magit)


(defun load_conf (prompt)
  (load-file "~/.emacs")
  (kbd "C-g")
)

(global-undo-tree-mode)

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-mode 1)

(setq evil-shift-width 4)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-complete-all-buffers nil)


(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)

(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings occur-mode 'emacs)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-s") 'git-gutter:stage-hunk)

(define-key evil-motion-state-map ";" 'evil-ex)
(define-key key-translation-map (kbd "C-c C-c") 'load_conf)
(define-key key-translation-map (kbd "C-p") 'projectile-find-file)
(setq mac-command-modifier 'meta)


(load-theme 'solarized-dark t)
(global-linum-mode 1)
(setq linum-format "%d ")
(menu-bar-mode -1)
(setq magit-last-seen-setup-instructions "1.4.0")

(setq auto-save-default nil)

(setq-default c-basic-offset 4
	      tab-width 4
	      indent-tabs-mode t)

(setq c-default-style "linux"
      c-basic-offset 4)
(define-key global-map (kbd "RET") 'newline-and-indent)
(define-key global-map (kbd "C-x w") 'whitespace-mode)
(define-key global-map (kbd "C-x RET") (kbd "M-j"))

(evil-ex-define-cmd "gdiff" 'vc-revision-other-window)
(evil-ex-define-cmd "gdiff", 'magit-commit)

(defun evil-ex-binding (command &optional noerror)
  "Returns the final binding of COMMAND."
  (let ((binding command))
    (when binding
      (string-match "^\\(.+?\\)\\!?$" binding)
      (setq binding (match-string 1 binding))
      (while (progn
               (setq binding (cdr (assoc binding evil-ex-commands)))
               (stringp binding)))
      (unless binding
        (setq binding (intern command)))
      (if (commandp binding)
          binding
        (unless noerror
          (command))))))

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
	'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
	'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(custom-set-variables
 '(git-gutter:update-interval 1))

(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

