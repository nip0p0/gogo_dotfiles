; Third party
;; install-elisp
;(setq load-path (cons "~/.emacs.d/elisp" load-path))
;(require 'install-elisp)
;(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

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


(require 'helm-config)
(helm-mode 1)


;(require 'ruby-electric)

; Basis
(set-default-coding-systems 'utf-8)
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

(global-set-key (kbd "\C-O")
                "my/insert-line-before")

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
