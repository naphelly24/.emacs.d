;;; init.el --- entry point -*- lexical-binding: t -*-
;;; Commentary:
;; bootstraps the configuration

;;; Code:

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter.
;; This requires lexical-binding, otherwise normal-gc-cons-threshold would be nil.
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(require 'init-packages)
(require 'init-exec-path)
(require 'init-evil)
(require 'init-better-defaults)
(require 'init-ui)
(require 'init-utils)
(require 'init-windows)
(require 'init-prog)
(require 'init-python)
(require 'init-web)
(require 'init-org)
(require 'init-essential-tools)
(require 'init-osx-keys)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
