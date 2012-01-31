(add-to-list 'load-path "~/.emacs.d/vendor")

(setq custom-file "~/.emacs.d/rmm5t/custom.el")
(load custom-file 'noerror)

(load "rmm5t/theme")
(load "rmm5t/env")
(load "rmm5t/global")
(load "rmm5t/defuns")
(load "rmm5t/bindings")
(load "rmm5t/tabs")
(load "rmm5t/disabled")
(load "rmm5t/fonts")
(load "rmm5t/utf-8")
(load "rmm5t/scratch")
(load "rmm5t/grep")
(load "rmm5t/diff")
(load "rmm5t/ido")
(load "rmm5t/dired")
(load "rmm5t/recentf")
(load "rmm5t/rectangle")
(load "rmm5t/org")
(load "rmm5t/zoom")
(load "rmm5t/flymake")
(load "rmm5t/javascript")
(load "rmm5t/ri-emacs")
(load "rmm5t/mac")
(load "rmm5t/server-mode")
(load "rmm5t/shell-mode")
(load "rmm5t/private" 'noerror)

;; (load "rmm5t/hl-line")
;; (load "rmm5t/iswitchb")

(vendor 'ruby-mode)
(vendor 'rinari)
(vendor 'textmate)
(vendor 'maxframe      'mf 'maximize-frame)
(vendor 'filladapt)
(vendor 'coffee-mode)
(vendor 'haml-mode)
(vendor 'sass-mode)
(vendor 'htmlize)
(vendor 'full-ack      'ack 'ack-same 'ack-find-same-file 'ack-find-file 'ack-interactive)
(vendor 'cdargs        'cv 'cdargs)
(vendor 'magit         'magit-status)
(vendor 'psvn          'svn-status)
(vendor 'js2-mode      'js2-mode)
(vendor 'markdown-mode 'markdown-mode)
(vendor 'textile-mode  'textile-mode)
(vendor 'csv-mode      'csv-mode)
(vendor 'yaml-mode     'yaml-mode)
(vendor 'inf-ruby      'inf-ruby)
(vendor 'rcodetools    'xmp)
(vendor 'yasnippet)
(vendor 'jekyll)
(vendor 'lua-mode      'lua-mode)
(vendor 'feature-mode)
(vendor 'mode-line-bell)
(vendor 'revbufs       'revbufs)
(vendor 'shell-pop)
(vendor 'mo-git-blame  'mo-git-blame-file 'mo-git-blame-current)
(vendor 'ace-jump-mode 'ace-jump-mode 'ace-jump-word-mode 'ace-jump-char-mode 'ace-jump-line-mode)
(vendor 'key-chord)

;; (vendor 'ruby-electric 'ruby-electric-mode)
;; (vendor 'auctex)