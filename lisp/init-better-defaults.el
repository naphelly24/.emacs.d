(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode t)

;; 不需要备份文件
(setq make-backup-files nil)

(setq auto-save-default nil)

(recentf-mode 1)			
(setq recentf-max-menu-items 25)


(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中一段文字 之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode t)


(provide 'init-better-defaults)
