;; -*- lexical-binding:t -*-
(require 'use-package)

(setq hailin/cursor-color "#FF5733F")

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen t)

;; 更改光标的样式
;; (setq-default cursor-type 't)
(set-cursor-color hailin/cursor-color)

;; full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)

;; 更改显示字体大小 14pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 140)

;; Non-zero values for `line-spacing' can mess up ansi-term and co,
;; so we zero it explicitly in those cases.
(add-hook 'term-mode-hook
          (lambda ()
            (setq line-spacing 0)))

;; theme config
(use-package monokai-theme
  :ensure t
  :config
  (load-theme 'monokai t)
  )

;; (use-package solarized-theme
;;   :ensure t
;;   :config
;;   (load-theme 'solarized-dark t)
;;   )

;; better info colors
(use-package info-colors
  :ensure t
  :config
  (add-hook 'Info-selection-hook 'info-colors-fontify-node)
  )

(use-package spaceline
  :ensure t
  :config
  (setq powerline-default-separator 'wave)
  (spaceline-spacemacs-theme)
  )

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  )

(when *is-a-mac*
  (use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  (setq-default beacon-size 25)
  (setq beacon-blink-duration 0.5)
  (setq beacon-color hailin/cursor-color)
  ))

(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))
        (:eval (if (buffer-modified-p) 
                   " *"))
        ))

(when *is-a-mac*
  (use-package ns-auto-titlebar
    :ensure t
    :config
    (ns-auto-titlebar-mode)
    ))

(use-package diredfl :ensure t
  :config
  (diredfl-global-mode)
  )

(provide 'init-ui)
