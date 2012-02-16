;;; Gotta do UTF-8

(require 'un-define "un-define" t)
(set-buffer-file-coding-system 'utf-8 'utf-8-unix)
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)



;;(if (equal current-language-environment "UTF-8") (prefer-coding-system 'gb2312) (prefer-coding-system 'Utf-8) ) ) ) (add-hook 'set-language-environment-hook 'utf8gbk) (set-lanaguage-environment 'UTF-8)
