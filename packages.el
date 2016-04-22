(setq kevin-package-list '(ace-jump-buffer dash avy ace-jump-mode ace-window avy alchemist pkg-info epl company dash elixir-mode pkg-info epl align-cljlet clojure-mode anzu avy biblio biblio-core dash seq let-alist biblio-core dash seq let-alist browse-kill-ring cider-decompile javap-mode cider seq spinner queue pkg-info epl clojure-mode cider-profile cider seq spinner queue pkg-info epl clojure-mode coffee-mode color-theme-sanityinc-tomorrow company-anaconda s dash anaconda-mode f dash s s dash pythonic f dash s s dash company csv-mode deferred diff-hl diminish discover-my-major makey dockerfile-mode easy-kill elisp-slime-nav elixir-mode pkg-info epl exec-path-from-shell expand-region flx-ido flx flycheck seq let-alist pkg-info epl dash gist gh logito pcache git-timemachine gitconfig-mode gitignore-mode god-mode grizzl guru-mode handlebars-mode ido-ubiquitous ido-completing-read+ inf-ruby jade-mode javap-mode js2-refactor yasnippet s dash multiple-cursors s js2-mode json-mode json-snatcher json-reformat json-reformat json-rpc json-snatcher less-css-mode let-alist logito magit magit-popup dash async git-commit with-editor dash async dash with-editor dash async dash async magit-popup dash async makey markdown-mode monokai-theme move-text multiple-cursors mustache-mode neotree nrepl-sync cider seq spinner queue pkg-info epl clojure-mode operate-on-number ov pcache popup projectile pkg-info epl dash puppet-mode pkg-info epl python-x folding pythonic f dash s s dash queue rainbow-delimiters rainbow-mode ruby-tools rvm s sass-mode haml-mode scss-mode seq smart-mode-line rich-minority smartparens dash smartrep smex solarized-theme dash spinner undo-tree use-package-chords vkill volatile-highlights web-mode with-editor dash async yaml-mode yari yasnippet zenburn-theme zop-to-char))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

                                        ; install the missing packages
(dolist (package kevin-package-list)
  (unless (package-installed-p package)
    (package-install package)))

(eval-when-compile
  (require 'use-package))
(use-package use-package-chords
  :config (key-chord-mode 1))

(use-package ace-jump-mode
  :chords (("jj" . ace-jump-char-mode)
           ("jk" . ace-jump-word-mode)
           ("jl" . ace-jump-line-mode)))
