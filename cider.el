;; Changes cider output
(setq cider-repl-result-prefix ";; => ")


;; Don't auto show errors in cider
(setq cider-auto-select-error-buffer nil)
(setq cider-show-error-buffer nil)

;; Enables eldoc (minibuffer arg hints)
(add-hook 'cider-mode-hook #'eldoc-mode)
