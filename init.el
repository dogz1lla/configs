;; /* -----------------------------------------------------------
;; |========================= Packages ==========================
;; `-------------------------------------------------------------

;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
			("gnu" . "http://elpa.gnu.org/packages/")
			("melpa" . "https://melpa.org/packages/"))
)
(package-initialize)

;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package)
)
(require 'use-package)

;; Vim mode
(use-package evil
	:ensure t
	:config
	(evil-mode 1)
)

;; Helm
(use-package helm
	:ensure t
	:init
	(setq helm-mode-fuzzy-match t)
	(setq helm-completion-in-region-fuzzy-match t)
	(setq helm-candidate-number-list 50)
)

;; WhichKey
(use-package which-key
	:ensure t
	:init
	(setq which-key-separator " ")
	(setq which-key-prefix-prefix "+")
	:config
	(which-key-mode)
)

;; Evil-surround mode
(use-package evil-surround
	:ensure t
	:config
	(global-evil-surround-mode 1)
)

;; Pyenv mode
(use-package pyenv-mode
	:ensure t
	:init
	(add-to-list 'exec-path "~/.pyenv/shims")
	(setenv "WORKON_HOME" "~/.pyenv/versions")
	:config
	(pyenv-mode)
)

;; highlight TODO, NOTE, etc
(use-package hl-todo
	:ensure t
	:init
	(setq hl-todo-keyword-faces
		'(("TODO" . "#FDFE02")
		  ("NOTE" . "#0BFF01"))
	)
	:config
	(global-hl-todo-mode 1)
)

;; /* -----------------------------------------------------------
;; |========================= Keybinds ==========================
;; `-------------------------------------------------------------

;; Custom keybindings
(use-package general
	:ensure t
	:config (general-define-key
		:states '(normal visual insert emacs)
		:prefix "SPC"
		:non-normal-prefix "M-SPC"
		"TAB" '(switch-to-prev-buffer :which-key "previous buffer")
		"SPC" '(helm-M-x :which-key "M-x")
		"pf" '(helm-find-files :which-key "find files")
		;; buffers
		"bb" '(helm-buffers-list :which-key "buffer list")
		;; Window
		"wl" '(windmove-right :which-key "move right")
		"wh" '(windmove-left :which-key "move left")
		"wk" '(windmove-up :which-key "move up")
		"wj" '(windmove-down :which-key "move bottom")
		"wv" '(split-window-right :which-key "split right")
		"ws" '(split-window-below :which-key "split bottom")
		"wc" '(delete-window :which-key "delete window")
		;; Others
		"at" '(ansi-term :which-key "open terminal")
	)
)

;; /* -----------------------------------------------------------
;; |==================== Custom behaviour =======================
;; `-------------------------------------------------------------

;; Smoother scroll
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)

;; Auto fill mode
(auto-fill-mode 1)
(setq comment-auto-fill-only-comments t)

;; Hook auto fill mode to the prog-mode
(add-hook 'prog-mode-hook 'auto-fill-mode)

;; /* -----------------------------------------------------------
;; |======================= Appearance ==========================
;; `-------------------------------------------------------------

;; Cleaner UI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)

;; Disable spash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Theme
(use-package doom-themes
	:ensure t
	:config
	(load-theme 'doom-dracula t)
)

;; Font
(set-frame-font "Monospace 16" nil t)

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

