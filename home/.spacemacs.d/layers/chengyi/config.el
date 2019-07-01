;; disable environment variable warning
(setq exec-path-from-shell-check-startup-files nil)

;; set coding
(define-coding-system-alias 'UTF-8 'utf-8)

;; For global
(setq-default tab-width 4)
(setq-default evil-shift-width 4)
;; For c-mode
(setq c-default-style "k&r")
(setq c-basic-offset 4)
;; For python-mode
(setq python-guess-indent nil
      python-indent-offset 4
      python-indent 4)

;; For go-mode
(setq go-format-before-save t)

;; For js-mode
(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)

;; fix neotree
;; cannot make side window the only window
;; SPC-fed 打开配置
;; SPC-feR 重新加载
(setq helm-split-window-inside-p t)
'(helm-autoresize-mode 1)
