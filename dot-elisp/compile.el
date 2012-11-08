(require 'cl)

(defun compile-in-directory (d)
  (let ((default-directory d))
    (call-interactively 'compile)))

(defun* find-makefile-directory-up
  (&optional (name "Makefile") (dir default-directory))
  (cond ((file-exists-p (expand-file-name name dir))
	 dir)
	((equal dir (expand-file-name "/"))
	 nil)
	(t
	 (find-makefile-directory-up name (expand-file-name "../" dir)))))

(defun haxe-compile ()
  (interactive)
  (compile-in-directory (find-makefile-directory-up "build.nmml")))
