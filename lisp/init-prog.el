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

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t)
  ;; lisp中不要补全'
  (sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
  )

(provide 'init-prog)
