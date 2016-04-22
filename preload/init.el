;;; kevinit --- Kevin's init package
;;; Commentary Kevin's init package

;;; Use Mac keys the reasonable way
;;; Code:
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;; Set Theme
(disable-theme 'zenburn)
(setq prelude-theme 'sanityinc-tomorrow-bright)

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

;; Sets Neotree teo F8
(global-set-key [f8] 'neotree-toggle)

;; Sets Alt + Space to delete all whitespace
(global-set-key (kbd "s-SPC") 'just-one-space)

;; Turns on line numbers
(global-linum-mode 1)

;; Adds js2 refactor everytime we use js2
;; (add-hook 'js2-mode-hook 'js2-jsx-mode)

;; Automatically makes directories when visiting a file that doesn't exist
;; Think mkdir -p
(defadvice find-file (before make-directory-maybe (filename &optional wildcards) activate)
  "Create parent directory if not exists while visiting file."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir)))))

