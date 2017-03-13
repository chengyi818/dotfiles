;; make_header
(spacemacs/set-leader-keys "oh" 'auto-make-header)

;; youdao dict
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

;;insert-state use control+l to move right
(define-key evil-insert-state-map (kbd "C-l") 'right-char)
