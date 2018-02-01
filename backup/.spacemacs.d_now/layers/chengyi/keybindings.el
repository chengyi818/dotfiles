;; make_header
(spacemacs/set-leader-keys "oh" 'auto-make-header)

;; youdao dict
(spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point+)

;;insert-state use control+l to move right
(define-key evil-insert-state-map (kbd "C-l") 'right-char)

;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)

;; remove ^M in emacs
(spacemacs/set-leader-keys "om" 'delete-carrage-returns)
(defun delete-carrage-returns ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (while (search-forward "\r" nil :noerror)
      (replace-match ""))))
