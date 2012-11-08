(add-hook 'clojure-mode-hook
	  '(lambda ()
	     (paredit-mode 1)
	     (setq indent-tabs-mode nil)
	     (define-clojure-indent
	       (with-primitive 1)
	       (with-gl 1)
	       (with-pushed-matrix 0)
	       (with-screen 1)
	       (-> 1))))
(add-to-list 'auto-mode-alist (cons "\\.clj\\'" 'clojure-mode))
