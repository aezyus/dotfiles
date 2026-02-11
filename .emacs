;; ----------------------------------------------------------------------
;; Package system
;; ----------------------------------------------------------------------

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; ----------------------------------------------------------------------
;; Treesitter
;; ----------------------------------------------------------------------

(require 'treesit)
(setq treesit-language-source-alist
      '((c3 "https://github.com/c3lang/tree-sitter-c3")
        (typst "https://github.com/uben0/tree-sitter-typst")))
(add-to-list 'treesit-extra-load-path "~/.emacs.d/tree-sitter")


;; ----------------------------------------------------------------------
;; Core packages
;; ----------------------------------------------------------------------

(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1))

(use-package lsp-mode :ensure t
  :hook (haskell-mode . lsp)
  :commands lsp)

(use-package lsp-haskell :ensure t)
(use-package envrc :ensure t :config (envrc-global-mode))
(use-package which-key :ensure t :config (which-key-mode 1))
(use-package yasnippet :ensure t :config (yas-global-mode 1))
(use-package dashboard :ensure t :config (dashboard-setup-startup-hook))
(use-package haskell-mode :ensure t)

;; ----------------------------------------------------------------------
;; Other requires (installed or local)
;; ----------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/lisp")

;; OdinMode
(use-package odin-mode
  :bind (:map odin-mode-map
	      ("C-c C-r" . 'odin-run-project)
	      ("C-c C-c" . 'odin-build-project)
	      ("C-c C-t" . 'odin-test-project)))

(require 'julia-formatter)
(require 'xscheme)
(require 'c3-ts-mode)

;; ----------------------------------------------------------------------
;; UI tweaks
;; ----------------------------------------------------------------------

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)

(setq display-line-numbers 'relative)
(setq dashboard-banner-logo-title "Emacs UWU ~ Miku")
(setq dashboard-center-content t)
(setq dashboard-vertically-center-content t)
(setq dashboard-startup-banner 5)

(set-face-attribute 'default nil :family "Iosevka" :height 180)
(when (member "Noto Color Emoji" (font-family-list))
  (set-fontset-font t 'symbol "Noto Color Emoji" nil 'prepend)
  (set-fontset-font t 'emoji  "Noto Color Emoji" nil 'prepend))

(load-theme 'wombat t)

;; ----------------------------------------------------------------------
;; Misc behavior
;; ----------------------------------------------------------------------

(setq dired-dwim-target t
      custom-safe-themes t
      custom-file (expand-file-name "custom.el" user-emacs-directory)
      whitespace-style '(face spaces empty tabs newline trailing space-mark tab-mark newline-mark)
      backup-directory-alist `(("." . "~/.emacs.d/backups/"))
      auto-save-file-name-transforms `((".*" "~/.emacs.d/auto-save-list/" t))
      org-directory "~/Notes"
      org-default-notes-file (concat org-directory "/inbox.org")
      org-return-follows-link t
      markdown-command "pandoc"
      lsp-ui-sideline-show-diagnostics t)

(global-set-key (kbd "C-d") #'duplicate-line)

(add-hook 'c-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'julia-mode-hook #'julia-repl-mode)

(treesit-ready-p 'typst t)

;; ----------------------------------------------------------------------
;; Shell
;; ----------------------------------------------------------------------
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
