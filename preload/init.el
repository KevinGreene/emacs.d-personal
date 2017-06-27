;;; kevinit --- Kevin's init package
;;; Commentary Kevin's init package

;;; Use Mac keys the reasonable way
;;; Code:
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

(scroll-bar-mode -1)

;;; Set Theme
(disable-theme 'zenburn)
;; If the below line throws an error, install
;; the package color-theme-sanityinc-tomorrow
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

;; Map C-x / to comment region
(global-set-key "\C-x\/" 'comment-region)

;; Map M-s-l to indent region, formatting the region.
;; Matches Intellij
(global-set-key "\M-s-l" 'indent-region)

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

;; Bigger font
(set-face-attribute 'default nil :height 150)


(defun my-personal-indents (n)
  (setq indent-tabs-mode nil) ; use space instead of tab
  (setq c-basic-offset n)
  ;; web lang indents
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq web-mode-attr-indent-offset n)
  (setq css-indent-offset n) ; css-mode
  )

(my-personal-indents 2)

;; Increments a number, useful to silence vim critics
;; As it's built into that platform
(defun increment-number-at-point ()
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

(global-set-key (kbd "C-c +") 'increment-number-at-point)


;; Set tab width to 4 (useful for golang)
(setq tab-width 4)
