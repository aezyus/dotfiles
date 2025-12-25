(require `dashboard)
(require `envrc)

;; Modes Settings
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-whitespace-mode 1)
(envrc-global-mode)
(which-key-mode 1)

;; Variables set
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq display-line-numbers `relative)
(setq custom-safe-themes t)
(setq-default whitespace-style '(face spaces empty tabs newline trailing space-mark tab-mark newline-mark))

;; Keys
(global-set-key (kbd "C-d") 'duplicate-line)

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

;; Dashboard Melpa
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Emacs UWU ~ Miku")
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-startup-banner 5)

(set-face-attribute 'default nil :font "Iosevka-12")


;; Eglot
;; (add-hook 'haskell-mode-hook #'eglot)

;; Haskell
(require 'haskell-mode)
(require 'lsp-haskell)
(add-hook 'haskell-mode-hook #'lsp)
;; Haskell variables
(setq lsp-ui-sideline-show-diagnostics t)

;; (Markdown mode)
(setq markdown-command "pandoc")
