(defun dictcn ()
  (interactive)
  (message
   (replace-regexp-in-string
   "<[^>]+>" " "
   (reduce 'concat
           (remove-if-not (lambda(s) (numberp (string-match "<key\\|<def" s)))
                          (split-string
                           (shell-command-to-string
                            (concat "curl -s 'http://api.dict.cn/ws.php?utf8=true&q=" (current-word) "'")) "\n"  t)
                          )))))