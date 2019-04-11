;; 快速打开配置文件
(defun open-init-packages-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-packages.el"))
;; 将函数 open-init-packages-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-packages-file)

;; company mode使用c-n c-p选择下一个/上一个匹配
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))


;; (global-set-key (kbd "C-h") 'backward-delete-char-untabify)

(provide 'init-keybindings)
