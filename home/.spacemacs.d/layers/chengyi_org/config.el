;; org-mode
(setq org-base-path "~/OneDrive/OneSyncFiles/org/")
(setq org-gtd-file-path (concatenate 'string org-base-path "GTD.org"))
(setq org-store-success-file-path (concatenate 'string org-base-path "store/Success.org"))
(setq org-crontab-file-path (concatenate 'string org-base-path "crontab/crontab.org"))
(setq org-review-file-path (concatenate 'string org-base-path "crontab/Review.org"))

(setq org-default-notes-file org-gtd-file-path)
(setq org-agenda-files (list org-gtd-file-path
                             org-crontab-file-path
                             org-review-file-path
                             ))

;; http://www.howardism.org/Technical/Emacs/journaling-org.html
;; add multi-file journal
(setq org-capture-templates
      '(
        ("i" "Inbox" entry (file+headline org-gtd-file-path "Inbox")
         "* %?\n  %i\n"
         :empty-lines 1)
        ("s" "Success 5+" entry (file org-store-success-file-path)
         "* %t\n\t1. %? %i"
         :empty-lines 1)
        ))

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

(setq org-tag-alist '(
                      ("1重要且紧急" . ?1)
                      ("2重要不紧急" . ?2)
                      ("3紧急不重要" . ?3)
                      ("4不重要不紧急" . ?4)
                      ("Algorithm" . ?a)
                      ("Review" . ?r)
                      ("Tip" . ?t)
                      ("Share" . ?s)
                      ))


;; org-table 中英文对齐问题
;; https://github.com/tumashu/cnfonts
(set-face-attribute
 'default nil
 :font (font-spec :name "-ADBO-Source Code Pro-ultrabold-italic-normal-*-*-*-*-*-m-0-iso10646-1"
                  :weight 'normal
                  :slant 'normal
                  :size 16))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-DAMA-Ubuntu Mono-normal-italic-normal-*-*-*-*-*-m-0-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 17.5)))
