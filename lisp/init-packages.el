;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |
(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			             ("melpa" . "http://elpa.emacs-china.org/melpa/")))
;; elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package diminish :ensure t)

(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

(provide 'init-packages)

