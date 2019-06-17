(require 'use-package)

(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  )

;; seems evil-jump-item (shipped with evil) already satisfied me
;; (use-package evil-matchit
;;   :ensure t
;;   :config
;;   (global-evil-matchit-mode 1)
;;   )

(provide 'init-evil)
