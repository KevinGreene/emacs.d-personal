;;; kevinit --- Kevin's init package
;;; Commentary Kevin's init package

;;; Use Mac keys the reasonable way
;;; Code:
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;; Set Theme to be tomorrow
;;; Code:
(disable-theme 'zenburn)
(setq prelude-theme 'sanityinc-tomorrow-night)

;; Get rid of whitespace mode
(setq prelude-whitespace nil)

;; Don't make the bell sound
(setq ring-bell-function 'ignore)


;; Cache projectile
(setq projectile-enable-caching t)

;; Map duplicate line to C-c C-d
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
  )
(global-set-key "\C-c\C-d" 'duplicate-line)

;; Sets Neotree to F8
(global-set-key [f8] 'neotree-toggle)

;; Turns on line numbers
(global-linum-mode 1)
