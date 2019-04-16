(require 'use-package)

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode)
  )

;; (use-package command-log-mode :ensure t)

(use-package counsel :ensure t)

(use-package ivy :ensure t
  :config
  (ivy-mode 1)
  (desktop-save-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)")
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-h f") 'counsel-describe-function)
  (global-set-key (kbd "C-h v") 'counsel-describe-variable)
  (global-set-key (kbd "C-h l") 'counsel-find-library)
  (global-set-key (kbd "C-h i") 'counsel-info-lookup-symbol)
  ;;(global-set-key (kbd "C-h u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)(ivy-mode 1)
  (desktop-save-mode t)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d)")
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-h f") 'counsel-describe-function)
  (global-set-key (kbd "C-h v") 'counsel-describe-variable)
  (global-set-key (kbd "C-h l") 'counsel-find-library)
  (global-set-key (kbd "C-h i") 'counsel-info-lookup-symbol)
  ;;(global-set-key (kbd "C-h u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "C-x C-b") 'ivy-switch-buffer)
  )

;; M-x reveal-in-osx-finder, open file in finder (OSX only)
(use-package reveal-in-osx-finder :ensure t)

(use-package goto-line-preview
  :ensure t
  :config
  (global-set-key (kbd "M-g g") 'goto-line-preview)
  )

(use-package ace-jump-mode
  :ensure t
  :config
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  )

(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.2)
  :diminish which-key-mode
  )

(provide 'init-essential-tools)
