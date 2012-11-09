(defvar *on-osx* nil)
(defvar *on-gentoo* nil)

(if (eq system-type 'darwin)
    (setq *on-osx* t)
  (setq *on-gentoo* t))

(when *on-gentoo*
  (load-library "site-start"))

(require 'cl)

(defun elisp-files-in-dir (dir)
  "List all elisp files in DIR"
  (let* ((files (mapcar
                 (lambda (string)
                   (string-match "^\\(.*\\)\\.elc?$" string)
                   (match-string 1 string))
                 (directory-files dir 'full "\\.elc?$")))
         (ptr files))
    (remove-duplicates files :test 'equal)
    files))

(mapcar 'load (elisp-files-in-dir "~/.elisp"))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-default-style (quote ((java-mode . "java") (awk-mode . "awk") (other . "bsd"))))
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(echo-keystrokes 0.01)
 '(fill-column 80)
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(js-indent-level 8)
 '(kill-whole-line t)
 '(mouse-wheel-progressive-speed nil)
 '(org-agenda-files (quote ("~/prog/gosearch/todo.org")))
 '(password-cache-expiry nil)
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(standard-indent 8)
 '(tool-bar-mode nil)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fringe ((((class color) (background light)) (:background "lightgray")))))

(put 'downcase-region 'disabled nil)

(put 'upcase-region 'disabled nil)
