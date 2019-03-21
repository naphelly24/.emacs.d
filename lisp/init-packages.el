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

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar hailin/packages '(
			  ;; --- Auto-completion ---
			  company
			  ;; --- Better Editor ---
			  hungry-delete
			  reveal-in-osx-finder ;; M-x reveal-in-osx-finder, open file in finder (OSX only)
			  helm
			  helm-ag
			  smex
			  ace-jump-mode
			  yaml-mode
			  ein ;; add the ein package (Emacs ipython notebook)
			  elpy
			  flycheck
			  py-autopep8
			  smartparens
			  ;; --- Major Mode ---
			  js2-mode
			  web-mode
			  ;; --- Minor Mode ---
			  nodejs-repl
			  exec-path-from-shell
			  ;; --- Themes ---
			  monokai-theme
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

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(global-company-mode t)

(load-theme 'monokai t)

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
;; C-h f, while Smex is active, runs describe-function on the currently selected command.
;; M-. jumps to the definition of the selected command.
;; C-h w shows the key bindings for the selected command. (Via where-is.)
;; smex-show-unbound-commands shows frequently used commands that have no key bindings.

;;(require 'helm-config)
;;(global-set-key (kbd "M-x") #'helm-M-x)
;;(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
;;(global-set-key (kbd "C-x C-f") #'helm-find-files)
;;(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
;;(helm-mode 1)

(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; PYTHON CONFIGURATION
(elpy-enable)

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-packages)
