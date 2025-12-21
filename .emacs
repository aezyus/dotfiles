;; Modes Settings
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Variables set
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq display-line-numbers `relative)
(setq custom-safe-themes t)

;; Theming
(load-theme `gruber-darker t)
(global-display-line-numbers-mode 1)


;; ----------------------------------------------------------------------

;; Melpa Package Source
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Move-text Melpa
(move-text-default-bindings)

