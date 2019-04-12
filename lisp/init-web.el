;;; init-js.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-

(require 'use-package)

(use-package js2-mode
  :ensure t
  :config
  ;; Change some defaults: customize them to override
  (setq-default js2-bounce-indent-p nil)
  ;; Disable js2 mode's syntax error highlighting by default...
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)
  ;; ... but enable it if flycheck can't handle javascript
  (autoload 'flycheck-get-checker-for-buffer "flycheck")

  (defun sanityinc/enable-js2-checks-if-flycheck-inactive ()
    (unless (flycheck-get-checker-for-buffer)
      (setq-local js2-mode-show-parse-errors t)
      (setq-local js2-mode-show-strict-warnings t)))

  (add-hook 'js2-mode-hook 'sanityinc/enable-js2-checks-if-flycheck-inactive 'add-node-modules-path)

  (setq-default js-indent-level 2)
  ;; In Emacs >= 25, the following is an alias for js-indent-level anyway
  (setq-default js2-basic-offset 2)

  (add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))
  (setq auto-mode-alist
        (append
         '(("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode))
         auto-mode-alist))
  )

(use-package add-node-modules-path :ensure t)

(use-package typescript-mode
  :ensure t
  :after add-node-modules-path
  :config
  (add-hook 'typescript-mode-hook 'add-node-modules-path)
  )

(use-package web-mode
  :ensure t
  :config
  (setq auto-mode-alist
        (append
         '(("\\.html\\'" . web-mode))
         '(("\\.xml?\\'" . web-mode))
         auto-mode-alist))
  )

(use-package prettier-js :ensure t)

(use-package nodejs-repl :ensure t)

(provide 'init-web)
