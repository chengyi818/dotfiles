;;;###autoload
;; temporiraliy set for file header
(setq make-header-author-name "pig")
(setq make-header-author-email "dog")
(setq make-header-shell-mode '#o755)
(defun make-cc-header ()
  (interactive )
  (insert "/*\n")
  (insert " * File Name: "(file-name-base (buffer-file-name))"."(file-name-extension (buffer-file-name))"\n")
  (insert " * Author: " make-header-author-name "\n")
  (insert " * Mail: " make-header-author-email "\n")
  (insert " * Created Time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  (insert " */\n")
  (insert "\n")
  (insert "#include \""(file-name-base (buffer-file-name))".h""\"\n\n"))
(defun make-h-header ()
  (interactive )
  (message "%s" make-header-author-name)
  (insert "/*\n")
  (insert " * File Name: " (file-name-base (buffer-file-name)) "." (file-name-extension (buffer-file-name)) "\n")
  (insert " * Author: " make-header-author-name "\n")
  (insert " * Mail: " make-header-author-email "\n")
  (insert " * Created Time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  (insert " */\n")
  (insert "\n")
  (insert "#ifndef __" (replace-regexp-in-string "-" "_" (upcase (file-name-base (buffer-file-name))))"_H__\n")
  (insert "#define __" (replace-regexp-in-string "-" "_" (upcase (file-name-base (buffer-file-name))))"_H__\n")
  (insert "\n")
  (insert "\n")
  (insert "\n")
  (insert "#endif /* __" (replace-regexp-in-string "-" "_" (upcase (file-name-base (buffer-file-name))))"_H__ */")
  (evil-goto-line 11)
  )
(defun make-java-header ()
  (interactive )
  (insert "/*\n")
  (insert " * File Name: "(file-name-base (buffer-file-name))"."(file-name-extension (buffer-file-name))"\n")
  (insert " * Author: " make-header-author-name "\n")
  (insert " * Mail: " make-header-author-email "\n")
  (insert " * Created Time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  (insert " */\n")
  (insert "\n"))
(defun make-sh-header ()
  (set-file-modes (buffer-file-name) make-header-shell-mode)
  (interactive )
  (insert "#!/bin/bash\n")
  (insert "# Author: " make-header-author-name "\n")
  (insert "# created time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  (insert "\n")
  )
(defun make-py-header ()
  (interactive )
  (insert "#!/usr/bin/env python\n")
  (insert "# -*- coding: UTF-8 -*-\n")
  ;; (insert "\"\"\"\n")
  (insert "# Author: " make-header-author-name "\n")
  (insert "# Mail: " make-header-author-email "\n")
  (insert "# created time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  ;; (insert "\"\"\"")
  (insert "\n"))
(defun make-go-header ()
  (interactive )
  (insert "/*\n")
  (insert " * File Name: "(file-name-base (buffer-file-name))"."(file-name-extension (buffer-file-name))"\n")
  (insert " * Author: " make-header-author-name "\n")
  (insert " * Mail: " make-header-author-email "\n")
  (insert " * Created Time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  (insert " */\n")
  (insert "\n"))
(defun make-makefile-header ()
  (interactive)
  (insert "# Author: " make-header-author-name "\n")
  (insert "# created time: " (format-time-string "%a %d %b %Y %r %Z")"\n")
  (insert "\n")
  )
(defun make-header ()
  (interactive)
  "make header by file type."
  (message "%s" major-mode)
  (let ((ccfiletypes '("c" "cpp" "cc")))
    (when (member (file-name-extension (buffer-file-name)) ccfiletypes)
      (make-cc-header)))
  (and (string= "h" (file-name-extension (buffer-file-name)))
       (make-h-header))
  (and (string= "sh-mode" major-mode)
       (make-sh-header))
  (and (string= "python-mode" major-mode)
       (make-py-header))
  (and (string= "go-mode" major-mode)
       (make-go-header))
  (and (string= "makefile-gmake-mode" major-mode)
       (make-makefile-header))
  (and (string= "java-mode" major-mode)
       (make-java-header))
  )
(defun auto-make-header ()
  (interactive)
  "Call `make-header' if current buffer is empty and is a file buffer."
  ;; (and (zerop (buffer-size)) (not buffer-read-only) (buffer-file-name)
  (evil-goto-first-line)
  (and  (not buffer-read-only) (buffer-file-name)
        (make-header)))
