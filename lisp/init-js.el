;;; init-js.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-

(setq auto-mode-alist
      (append
       '(("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; js2-mode

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

(defun hailin/disable-js2-reparse ()
  (progn
    (setq forward-sexp-function nil)
    (setq blink-matching-paren nil)
    (set (make-local-variable 'semantic-mode) nil)
    ))

(add-hook 'js2-mode-hook 'sanityinc/enable-js2-checks-if-flycheck-inactive 'add-node-modules-path)

;; (add-hook 'js2-mode-hook 'hailin/disable-js2-reparse 'sanityinc/enable-js2-checks-if-flycheck-inactive 'add-node-modules-path)


;;  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))

(setq-default js-indent-level 2)
;; In Emacs >= 25, the following is an alias for js-indent-level anyway
(setq-default js2-basic-offset 2)

(add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))

(eval-after-load 'typescript-mode
  (add-hook 'typescript-mode-hook 'add-node-modules-path))

(provide 'init-js)
