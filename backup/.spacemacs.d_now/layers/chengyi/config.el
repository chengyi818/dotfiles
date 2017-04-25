;; disable environment variable warning
(setq exec-path-from-shell-check-startup-files nil)

;; set coding
(define-coding-system-alias 'UTF-8 'utf-8)

(defun magit-push-to-gerrit ()
  (interactive)
  (magit-git-command "push origin HEAD:refs/for/master" (magit-toplevel)))

(with-eval-after-load 'magit
  (progn
    (magit-define-popup-action 'magit-push-popup
      ?g
      "Push to gerrit"
      'magit-push-to-gerrit)))
