; packages
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(setq package-list
      '(magit neotree helm cider clojure-mode solarized-theme))

(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

					
; visual
(set-face-attribute 'default nil :font "IBM Plex Mono" :height 140)
(load-theme 'solarized-light t)
(global-display-line-numbers-mode)
(tool-bar-mode -1)


; keys
(global-set-key (kbd "M-o") 'other-window)
(global-set-key (kbd "C-x g") 'magit-status)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)


; other
(desktop-save-mode 1)
(save-place-mode 1)

(setq apropos-sort-by-scores t)

(add-to-list 'exec-path "/usr/local/bin")

(require 'helm-config)
(ido-mode 1)
(setq ido-everywhere t)
(setq ido-enable-flex-matching t)


