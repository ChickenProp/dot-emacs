(defun count-words ()
  (interactive)
  (shell-command-on-region (point-min) (point-max) "wc"))
(global-set-key (kbd "C-c C-w") 'count-words)

(global-set-key (kbd "C-j") 'join-line)
(global-set-key (kbd "<f5>") 'compile)

(eval-after-load 'haxe-mode
  '(define-key haxe-mode-map (kbd "<f5>") 'haxe-compile))

;; In visual mode, I still want to delete to the end of the logical line.
;; This overrides the remap from kill-line to kill-visual-line, defined in
;; the original version of visual-line-mode-map.
(define-key visual-line-mode-map [remap kill-line] 'kill-line)
