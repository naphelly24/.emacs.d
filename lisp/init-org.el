(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-hide-leading-stars t)
(setq org-agenda-files (list "~/org/work.org"
			                 "~/org/personal.org"))
(setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))

(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file "~/org/work.org")))

(setq org-default-notes-file "~/org/capture.org")

(provide 'init-org)
