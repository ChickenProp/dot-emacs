;;; cperl-mode is preferred to perl-mode                                        
(defalias 'perl-mode 'cperl-mode)

;; Don't show trailing whitespace with an underline.
(setq cperl-invalid-face nil)

(add-hook 'cperl-mode-hook
          (lambda ()
	    (setq cperl-indent-level 8)))
