;; org-mode
(setq org-agenda-files (list "~/Dropbox/org/"))
(setq org-default-notes-file "~/Dropbox/org/GTD.org")
(setq org-todo-keywords
      (quote ((sequence  "STARTED(s)" "TODO(t)" "INBOX(i)" "|" "DONE(d)")
              (sequence "WAITING(w)" "SOMEDAY(S)"  "|" "CANCELLED(c)" "MEETING(m)" "PHONE(p)"))))
(setq org-M-RET-may-split-line nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")

;; the %i would copy the selected text into the template
;; http://www.howardism.org/Technical/Emacs/journaling-org.html
;; add multi-file journal
(setq org-capture-templates
      '(("i" "Inbox" entry (file+headline "~/Dropbox/org/GTD.org" "Inbox")
         "* INBOX [#B] %?\n  %i\n"
         :empty-lines 1)
        ("b" "Blog Ideas" entry (file+headline "~/Dropbox/org/Blog.org" "Blog Ideas")
         "* TODO [#B] %?\n  %i\n %U"
         :empty-lines 1)
        ("l" "links" entry (file+headline "~/Dropbox/org/GTD.org" "Inbox")
         "* TODO [#C] %?\n  %i\n %a \n %U"
         :empty-lines 1)
        ))
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("Learning" . ?L) ("Need_buy" . ?N)("Wiznote" . ?W)("Once" . ?O)("Twice" . ?T)))
