;; org-mode
(setq org-agenda-files (list "~/Nutstore/org/GTD.org"
                             "~/Nutstore/org/crontab/crontab.org"
                             "~/Nutstore/org/crontab/blog.org"
                             "~/Nutstore/org/crontab/Review_Daily.org"
                             "~/Nutstore/org/crontab/Review_Weekly.org"
                             "~/Nutstore/org/crontab/Review_Monthly.org"
                             ))
(setq org-default-notes-file "~/Nutstore/org/GTD.org")
(setq org-todo-keywords
      (quote (
              (sequence "TODO(t)" "|" "DONE(d)")
              (sequence "SCHEDULED(s)" "|" "SOMEDAY(S)")
              (sequence "|" "CANCELED(c)")
              )))
(setq org-M-RET-may-split-line nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; the %i would copy the selected text into the template
;; http://www.howardism.org/Technical/Emacs/journaling-org.html
;; add multi-file journal
(setq org-capture-templates
      '(("i" "Inbox" entry (file+headline "~/Nutstore/org/GTD.org" "Inbox")
         "* %?\n  %i\n"
         :empty-lines 1)
        ))

(setq org-tag-alist '(
                      ("Blog" . ?b)
                      ("Dream" . ?d)
                      ("@Family" . ?f)
                      ("Kata" . ?k)
                      ("Project" . ?p)
                      ("Read" . ?r)
                      ("Shopping" . ?s)
                      ("Tech" . ?t)
                      ("Target" . ?T)
                      ("@Work" . ?w)
                      ("Wiznote" . ?W)
                      ))
