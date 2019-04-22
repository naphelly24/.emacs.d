;; -*- lexical-binding: t -*-
(require 'use-package)

(use-package org :ensure t
  :config
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (setq org-hide-leading-stars t)
  (setq org-agenda-files (list "~/org/work.org"
			                   "~/org/personal.org"
                               "~/org/capture.org"
                               ))
  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))

  (global-set-key (kbd "C-c o")
                  (lambda () (interactive) (find-file "~/org/work.org")))

                                        ; fall back file for org-capture
  (setq org-default-notes-file "~/org/capture.org")

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  (setq org-capture-templates
        '(("t" "TODO" entry (file+headline "~/org/capture.org" "Collect")
           "* TODO %?\n")
          ("s" "Scheduled TODO" entry (file+headline "~/org/capture.org" "Collect")
           "* TODO %?\nSCHEDULED: %^t\n")
          ("d" "Deadline" entry (file+headline "~/org/capture.org" "Collect")
           "* TODO %?\n  DEADLINE: %^t")
          ("p" "Priority" entry (file+headline "~/org/capture.org" "Collect")
           "* TODO [#A] %?\n  SCHEDULED: %^t")
          ("n" "Note" entry (file+headline "~/org/capture.org" "Notes")
           "* %?\n%U")
          ("j" "Journal" entry (file+datetree "~/org/jounal.org")
           "* %?\nEntered on %U\n")))

  (setq org-publish-project-alist
        '(
          ("org-notes"
           :base-directory "~/org/"
           :base-extension "org"
           :publishing-directory "~/org/publish/"
           :recursive t
           :htmlize-source t
           :publishing-function org-html-publish-to-html
           :headline-levels 4             ; Just the default for this project.
           :auto-preamble t
           :auto-sitemap t                ; Generate sitemap.org automagically...
           :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
           :sitemap-title "sitemap"         ; ... with title 'sitemap'.
           )
          ("org-static"
           :base-directory "~/org/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/org/publish/attachment/"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("org" :components ("org-notes" "org-static"))
          ))
  )

(use-package htmlize :ensure t
  :requires org
  )

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))

  )

(provide 'init-org)

