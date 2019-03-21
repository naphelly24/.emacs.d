(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; package management
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-keybindings)
(require 'init-defaults)
(require 'init-functions)

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
