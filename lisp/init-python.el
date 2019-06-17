(require 'use-package)

(use-package flycheck :ensure t
  :config
  (custom-set-variables
   '(flycheck-python-flake8-executable "python3")
   '(flycheck-python-pycompile-executable "python3")
   '(flycheck-python-pylint-executable "python3"))
  )

(use-package py-autopep8
  :ensure t
  :config
  (require 'py-autopep8)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

(use-package ein :ensure t)

(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  ;; use flycheck not flymake with elpy
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

  (setq elpy-rpc-python-command "python3")
  )

;; config interpreter
;; (setq python-shell-interpreter "python3")

;; (setq python-shell-interpreter "ipython"
      ;; python-shell-interpreter-args "--simple-prompt -c exec('__import__(\\'readline\\')') -i")

(setq python-shell-interpreter "jupyter"
     python-shell-interpreter-args "console --simple-prompt"
     python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
            "jupyter")

(provide 'init-python)
