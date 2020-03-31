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
		  ("NOTE" . "#0BFF01")
		  ("CRITICAL" . "FF0000"))
	)
	:config
	(global-hl-todo-mode 1)
)

;; add an option of quitting insert mode with "jk"
(use-package evil-escape
	:ensure t
	:init
	(setq-default evil-escape-key-sequence "jk") 
	:config
	(evil-escape-mode 1)
)

;; Smart mode-line
(use-package smart-mode-line
	:ensure t
	:init
	(setq sml/no-confirm-load-theme t)
	(setq sml/theme 'dark)
	(setq rm-blacklist (list "jk" " WK" " Undo-Tree" " ElDoc" " Fill"))
	:config
	(sml/setup)
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
		"." '(helm-mini :which-key "buffers and recentf")
		"bs" '(save-buffer :which-key "buffer save")
		"bl" '(evil-switch-to-windows-last-buffer :which-key "buffer last")
		"bk" '(kill-this-buffer :which-key "buffer kill")
		;; Window
		"wl" '(windmove-right :which-key "move right")
		"wh" '(windmove-left :which-key "move left")
		"wk" '(windmove-up :which-key "move up")
		"wj" '(windmove-down :which-key "move bottom")
		"wv" '(split-window-right :which-key "split right")
		"ws" '(split-window-below :which-key "split bottom")
		"wc" '(delete-window :which-key "delete window")
		;; Others
		"fr" '(recentf-open-files :which-key "recent files")
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

;; Disable backup files
(setq make-backup-files nil)

;; Highlight current line
(global-hl-line-mode 1)

;; Display column number
(column-number-mode 1)

;; Display relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-width-start 1)
(setq display-line-numbers-type 'relative)

;; Disable spash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; /* -----------------------------------------------------------
;; |======================= Appearance ==========================
;; `-------------------------------------------------------------

;; Cleaner UI
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(blink-cursor-mode -1)

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
