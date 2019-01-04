;; org-mode
(setq org-agenda-files (list "~/Nutstore/org/GTD.org"
                             "~/Nutstore/org/crontab/crontab.org"
                             "~/Nutstore/org/crontab/blog.org"
                             "~/Nutstore/org/crontab/Review_Daily.org"
                             "~/Nutstore/org/crontab/Review_Weekly.org"
                             "~/Nutstore/org/crontab/Review_Monthly.org"
                             "~/Nutstore/org/crontab/Review_Yearly.org"
                             ))
(setq org-default-notes-file "~/Nutstore/org/GTD.org")
(setq org-todo-keywords
      (quote (
              (sequence "TODO(t)" "|" "DONE(d)")
              (sequence "SCHEDULED(s)" "|" "WAITING(w)")
              (sequence "|" "CANCELED(c)")
              )))
(setq org-M-RET-may-split-line nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
(setq org-bullets-bullet-list '("🐉" "🐠" "🐬" "🐤"))
;; (setq org-bullets-bullet-list '("🐭" "🐮" "🐯" "🐰" "🐲" "🐍" "🐴" "🐑" "🙉" "🐔" "🐶" "🐷"))

;; the %i would copy the selected text into the template
;; http://www.howardism.org/Technical/Emacs/journaling-org.html
;; add multi-file journal
(setq org-capture-templates
      '(
        ("i" "Inbox" entry (file+headline "~/Nutstore/org/GTD.org" "Inbox")
         "* %?\n  %i\n"
         :empty-lines 1)
        ("s" "Success 5+" entry (file "~/Nutstore/org/store/Success.org")
         "* %t\n\t1. %? %i"
         :empty-lines 1)
        ))

(setq org-tag-alist '(
                      ("1重要且紧急" . ?1)
                      ("2重要不紧急" . ?2)
                      ("3紧急不重要" . ?3)
                      ("4不重要不紧急" . ?4)
                      ))
