(require 'use-package)

(use-package company
  :ensure t
  :config
  (global-company-mode t)
  ;; 使用c-n c-p选择下一个/上一个匹配
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  )

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-x M-g") 'magit-dispatch)
  )

(use-package yaml-mode :ensure t)

(use-package json-mode :ensure t)

(use-package docker :ensure t)

(use-package dockerfile-mode :ensure t)

(use-package docker-compose-mode :ensure t)

(use-package yasnippet :ensure t
  :config
  (require 'yasnippet)
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets :ensure t)

(use-package expand-region :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  ;; lisp中不要补全'
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  )

(use-package groovy-mode :ensure t
  ;; :config
  ;; (setq auto-mode-alist
  ;;       (append
  ;;        '(("\\.gradle\\'" . groovy-mode))
  ;;        auto-mode-alist))
  )

(use-package go-mode :ensure t
  :config
  (autoload 'go-mode "go-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  )

(provide 'init-prog)
