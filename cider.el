(load "clojure-mode")

;; Changes cider output
(setq cider-repl-result-prefix ";; => ")


;; Don't auto show errors in cider
(setq cider-auto-select-error-buffer nil)
(setq cider-show-error-buffer nil)

;; Save history to file
(setq cider-repl-history-file "~/.cider_history")

;; Enables eldoc (minibuffer arg hints)
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'clojure-mode-hook #'cider-mode)

;; Correct indentation for om.next
(define-clojure-indent
  (defui '(1 :form (:defn)))
  (dom/div '(1 :form)))
