;;; kevinit --- Kevin's init package
;;; Commentary Kevin's init package

;;; Use Mac keys the reasonable way
;;; Code:
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)


(setq kevin-package-list '(ace-jump-buffer dash avy ace-jump-mode ace-window avy alchemist pkg-info epl company dash elixir-mode pkg-info epl align-cljlet clojure-mode anzu avy biblio biblio-core dash seq let-alist biblio-core dash seq let-alist browse-kill-ring cider-decompile javap-mode cider seq spinner queue pkg-info epl clojure-mode cider-profile cider seq spinner queue pkg-info epl clojure-mode coffee-mode color-theme-sanityinc-tomorrow company-anaconda s dash anaconda-mode f dash s s dash pythonic f dash s s dash company csv-mode deferred diff-hl diminish discover-my-major makey dockerfile-mode easy-kill elisp-slime-nav elixir-mode pkg-info epl exec-path-from-shell expand-region flx-ido flx flycheck seq let-alist pkg-info epl dash gist gh logito pcache git-timemachine gitconfig-mode gitignore-mode god-mode grizzl guru-mode handlebars-mode ido-ubiquitous ido-completing-read+ inf-ruby jade-mode javap-mode js2-refactor yasnippet s dash multiple-cursors s js2-mode json-mode json-snatcher json-reformat json-reformat json-rpc json-snatcher less-css-mode let-alist logito magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async makey markdown-mode monokai-theme move-text multiple-cursors mustache-mode neotree nrepl-sync cider seq spinner queue pkg-info epl clojure-mode operate-on-number ov pcache popup projectile pkg-info epl dash puppet-mode pkg-info epl python-x folding pythonic f dash s s dash queue rainbow-delimiters rainbow-mode ruby-tools rvm s sass-mode haml-mode scss-mode seq smart-mode-line rich-minority smartparens dash smartrep smex solarized-theme dash spinner undo-tree vkill volatile-highlights web-mode with-editor dash async yaml-mode yari yasnippet zenburn-theme zop-to-char))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

                                        ; install the missing packages
(dolist (package kevin-package-list)
  (unless (package-installed-p package)
    (package-install package)))


;;; Set Theme
(disable-theme 'zenburn)
(setq prelude-theme 'sanityinc-tomorrow-bright)
;;(setq prelude-theme 'monokai)


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


