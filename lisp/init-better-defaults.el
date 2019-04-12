(setq debug-on-error t)

(setq ring-bell-function 'ignore)
;; 自动加载磁盘上被修改的文件
(global-auto-revert-mode t)

;; 显示行号
(global-linum-mode t)

;; 不需要备份文件
;; (setq make-backup-files nil)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 选中一段文字 之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode t)

(fset 'yes-or-no-p 'y-or-n-p)

;; dird开的buffer使用同一个缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; C-x C-j 进入当前文件夹的所在的路径
(require 'dired-x)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 文本解码设置默认为 UTF-8
(set-language-environment "UTF-8")

;; 光标在括号内时也高亮括号(performance issue)
;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
;; 	     (funcall fn)))))

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)	;use space instead of tab
(setq-default show-trailing-whitespace t)
;; prefer tab as tab instead of command indent-for-tab-command
(global-set-key (kbd "TAB") 'self-insert-command)

;; don't show trainling space for term mode, it's ugly
(add-hook 'term-mode-hook (lambda () (setq show-trailing-whitespace nil)))
;; don't show line number for term mode.
;; https://stackoverflow.com/questions/6837511/automatically-disable-a-global-minor-mode-for-a-specific-major-mode
(add-hook 'term-mode-hook 'hailin/inhibit-global-linum-mode)
(defun hailin/inhibit-global-linum-mode ()
  "Counter-act `global-linum-mode'."
  (add-hook 'after-change-major-mode-hook
            (lambda () (linum-mode 0))
            :append :local))

(setq suggest-key-bindings 1) ;show key binding after using command

;; Navigate windows with M-<arrows>
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

(provide 'init-better-defaults)
