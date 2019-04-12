;; Find Executable Path on OS X
(require 'use-package)

(when *is-a-mac*
  (use-package exec-path-from-shell
    :ensure t
    :config (exec-path-from-shell-initialize)
    ))

(provide 'init-exec-path)
