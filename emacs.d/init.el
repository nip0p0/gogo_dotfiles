;;; gogodotfiles --- Gogo

;; Copyright (C) 2014  Gogo Tanaka

;;; Commentary:
;; gogo

;;; Code:


;;;; Third party
;; install-elisp
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; key-combo
(require 'key-combo)
(key-combo-mode 1)
(global-key-combo-mode t)
(key-combo-define-global (kbd "=") '(" = " " == " " === " ))
(key-combo-define-global (kbd "=>") " => ")
(key-combo-define-global (kbd ">") '(" > " " => "))
(key-combo-define-global (kbd "<") '(" < " " =< "))

;; Helm
(require 'helm-config)
(helm-mode 1)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Helm-projectile
;(add-hook 'ruby-mode-hook 'helm-projectile)
(global-set-key "\C-t" 'helm-projectile)

;(global-set-key (kbd "M-p") "flycheck-previous-error")
;(global-set-key (kbd "M-n") "flycheck-next-error")
(global-set-key  "\M-p" 'flycheck-previous-error)
(global-set-key  "\M-n" 'flycheck-next-error)


;; flycheck-pos-tip
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))


;; powerline
(require 'powerline)
(powerline-default-theme)
(setq powerline-arrow-shape 'curve)


;(require 'ruby-electric)

; Basis
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(setq makebackup-files nil)
(setq frame-title-fomat "%f")
(setq inhibit-startup-message t)
(setq completion-ignore-case t)

(show-paren-mode)
(show-paren-mode t)

(set-face-background 'default "black")
(set-face-foreground 'default "green")
(set-face-background 'region "white")
(set-face-foreground 'region "black")
(set-frame-parameter nil 'alpha 75)

(global-set-key "\C-h" 'delete-backward-char)
;(global-set-key "\C-m" 'newline-and-indent)
(global-set-key  "\C-j" 'newline)
;(global-set-key (kbd "C-u") "C-_")
(global-set-key "\C-u" 'undo)

; same for M-x linum-mode
(global-linum-mode t)

(global-auto-revert-mode 1)

;; Delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun my/insert-line-before ()
  "Insert a newline above the line containing the cursor"
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
		(newline)))


(global-set-key  "\C-O" 'my/insert-line-before)


; Highlight current row
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;;; init.el ends here
