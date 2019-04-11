;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |


(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.emacs-china.org/gnu/")
			               ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar hailin/packages '(
			              company
			              hungry-delete
                          command-log-mode
			              reveal-in-osx-finder ;; M-x reveal-in-osx-finder, open file in finder (OSX only)
                          diredfl ;; Extra Emacs font lock rules for a more colourful dired
                          switch-window
                          beacon
                          goto-line-preview
                          rainbow-delimiters
			              ivy
			              counsel
                          ;; smex
			              ace-jump-mode
			              yaml-mode
                          magit
			              ein ;; add the ein package (Emacs ipython notebook)
			              elpy
			              flycheck
			              py-autopep8
			              smartparens
                          json-mode
                          ;; js
			              js2-mode
                          typescript-mode
                          prettier-js
			              web-mode
                          nodejs-repl
                          add-node-modules-path
                          ;; end of js
			              exec-path-from-shell
                          org
                          ;; spacemacs-theme
                          spaceline
                          ;; monokai-theme
			              solarized-theme
                          docker
                          dockerfile-mode
                          docker-compose-mode
                          info-colors
			              ) "Default packages")

(setq package-selected-packages hailin/packages)

(defun hailin/packages-installed-p ()
  (loop for pkg in hailin/packages
	    when (not (package-installed-p pkg)) do (return nil)
	    finally (return t)))
(unless (hailin/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg hailin/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-hungry-delete-mode)
(beacon-mode 1)
(setq-default beacon-size 25)
(setq beacon-blink-duration 0.5)
(smartparens-global-mode t)

(global-company-mode t)

(diredfl-global-mode)

;; theme config
;;(load-theme 'spacemacs-dark t)
(load-theme 'solarized-dark t)
(setq powerline-default-separator 'wave)
(spaceline-spacemacs-theme)



(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "M-g g") 'goto-line-preview)

(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; magit settings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)

;; color info
(add-hook 'Info-selection-hook 'info-colors-fontify-node)

(provide 'init-packages)
