;; org-mode
(setq org-agenda-files (list "~/Dropbox/org/"))
(setq org-default-notes-file "~/Dropbox/org/GTD.org")
(setq org-todo-keywords
      (quote (
              (sequence "TODO(t)" "|" "DONE(d!)")
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
      '(("i" "Inbox" entry (file+headline "~/Dropbox/org/GTD.org" "Inbox")
         "* %?\n  %i\n"
         :empty-lines 1)
        ))

(setq org-tag-alist '(
                      ("@work" . ?w)
                      ("@family" . ?f)
                      ("learning" . ?l)
                      ("personal" . ?p)
                      ("Wiznote" . ?W)
                      ("Read" . ?r)
                      ))
