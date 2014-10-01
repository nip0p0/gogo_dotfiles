;Basis
(show-paren-mode t)
(setq-default tab-width 2)
(setq frame-title-fomat "%f")
(setq inhibit-startup-message t)
(set-face-background 'default "black")
(set-face-foreground 'default "green")
(set-face-background 'region "white")
(set-face-foreground 'region "black")
(set-frame-parameter nil 'alpha 75)


(set-frame-font "Ricty 24" nil t)


(defun my/insert-line-before ()
  "Insert a newline above the line containing the cursor"
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
		(newline)))

(global-set-key (kbd "C-S-o")
                "my/insert-line-before")
