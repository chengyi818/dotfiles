;; disable environment variable warning
(setq exec-path-from-shell-check-startup-files nil)

;; set coding
(define-coding-system-alias 'UTF-8 'utf-8)

(defun magit-push-to-gerrit-master ()
  (interactive)
  (magit-git-command-topdir "git push origin HEAD:refs/for/master"))

(defun magit-push-to-gerrit-develop ()
  (interactive)
  (magit-git-command-topdir "git push origin HEAD:refs/for/develop"))

(with-eval-after-load 'magit
  (progn
    (magit-define-popup-action 'magit-push-popup
      ?g
      "Push to gerrit master"
      'magit-push-to-gerrit-master)
    (magit-define-popup-action 'magit-push-popup
      ?d
      "Push to gerrit develop"
      'magit-push-to-gerrit-develop)
    ))
