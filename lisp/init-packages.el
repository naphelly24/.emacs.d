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
			              ;; --- Auto-completion ---
			              company
			              ;; --- Better Editor ---
			              hungry-delete
			              reveal-in-osx-finder ;; M-x reveal-in-osx-finder, open file in finder (OSX only)
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
			              js2-mode
			              web-mode
			              nodejs-repl
			              exec-path-from-shell
                          org
			              ;; --- Themes ---
                          
                          spacemacs-theme
                          spaceline
                          ;; monokai-theme
			              ;; solarized-theme
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

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(global-hungry-delete-mode)

(smartparens-global-mode t)

(global-company-mode t)

;; theme config
(load-theme 'spacemacs-light t)
(setq powerline-default-separator 'wave)
(spaceline-spacemacs-theme)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; magit settings
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch)


(provide 'init-packages)

