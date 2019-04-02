(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defconst *is-a-mac* (eq system-type 'darwin))

;; package management
(require 'init-packages)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-functions)
(require 'init-python)
(require 'init-org)
(require 'init-ivy)
(require 'init-keybindings)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
