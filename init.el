;; ============================ ;;
;;       ___           ___      ;;
;;      /  /\         /  /\     ;; **DESCRIPTION:**
;;     /  /:/_       /  /::|    ;; emacs config
;;    /  /:/ /\     /  /:/:|    ;; 
;;   /  /:/_/::\   /  /:/|:|__  ;; **AUTHOR:**
;;  /__/:/__\/\:\ /__/:/ |:| /\ ;; dogz1lla
;;  \  \:\ /~~/:/ \__\/  |:|/:/ ;; https://github.com/dogz1lla
;;   \  \:\  /:/      |  |:/:/  ;; 
;;    \  \:\/:/       |  |::/   ;; **DATE:**
;;     \  \::/        |  |:/    ;; 2020/04/05
;;      \__\/         |__|/     ;;
;; ============================ ;;
;;
;; Some related links:
;; * Exhaustive helm tutorial:
;;   http://tuhdo.github.io/helm-intro.html
;; * Org-agenda workflow example:
;;   http://cachestocaches.com/2016/9/my-workflow-org-agenda/
;; * Org-agenda view tweaking:
;;   https://blog.aaronbieber.com/2016/09/24/an-agenda-for-life-with-org-mode.html
;; * Org-mode quick guide:
;;   https://orgmode.org/guide/index.html

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
		  ("CRITICAL" . "#FF0000"))
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
	(add-to-list 'sml/replacer-regexp-list '("^~/code/bluanalytics/" ":WORK:") t)
)

;; org-mode <3
(use-package org
  :init
  (add-hook 'org-mode-hook 'visual-line-mode)
  (add-hook 'org-mode-hook 'org-indent-mode)
  (setq org-agenda-files '("~/code/org/"))
  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "INACTIVE(i)" "MEETING(m)" "|" "CANCELLED(c)" "DONE(d!)")))
  (setq org-tag-alist '(("@WORK" . ?w)
			("@HOME" . ?h)))
  (setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
  (setq org-capture-bookmark nil)
  :defer t
  :config
  (require 'org)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
   ))
  (setq org-src-fontify-natively t)
  (setq org-default-notes-file "~/code/org/todo.org")
  (setq org-capture-templates
	'(("t" "todo" entry (file org-default-notes-file)
	   "* TODO %? \n %u \n %a \n" :clock-in t :clock-resume t)
	  ("m" "Meeting" entry (file org-default-notes-file)
	   "* MEETING with %? :MEETING:\n%t" :clock-in t :clock-resume t)
	  ("d" "Diary" entry (file+datetree "~/code/org/diary.org")
	   "* %?\n%U\n" :clock-in t :clock-resume t)
	  ("i" "Idea" entry (file "~/code/org/idea.org")
	   "* %? :IDEA: \n%t" :clock-in t :clock-resume t)
	  ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
	   "** NEXT %? \nDEADLINE: %t") )) 
  )

;; Fancy bullets in org
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; Autocompletion with company
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Clojure-mode 
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;; Cider
(unless (package-installed-p 'cider)
  (package-install 'cider))

;; Slime
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "sbcl")


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
		"." '(helm-M-x :which-key "M-x")
		"ff" '(helm-find-files :which-key "find files")
		;; buffers
		"TAB" '(switch-to-prev-buffer :which-key "previous buffer")
		"SPC" '(helm-mini :which-key "buffers and recentf")
		"bs" '(save-buffer :which-key "buffer save")
		"bl" '(evil-switch-to-windows-last-buffer :which-key "buffer last")
		"bk" '(kill-this-buffer :which-key "buffer kill")
		"RET" '(helm-bookmarks :which-key "bookmarks")
		;; Window
		"wl" '(windmove-right :which-key "move right")
		"wh" '(windmove-left :which-key "move left")
		"wk" '(windmove-up :which-key "move up")
		"wj" '(windmove-down :which-key "move bottom")
		"wv" '(split-window-right :which-key "split right")
		"ws" '(split-window-below :which-key "split bottom")
		"wc" '(delete-window :which-key "delete window")
		;; Others
		"at" '(shell :which-key "open shell")
		"oa" '(org-agenda :which-key "org agenda")
		"oc" '(org-capture :which-key "org capture")
		)
	        (general-define-key
		 :keymaps 'helm-map
		 "C-j" 'helm-next-line
		 "C-k" 'helm-previous-line
		 )
		;; org mode keybinds
	        (general-define-key
		 :keymaps 'org-mode-map
		 :states '(normal emacs)
		 :prefix "SPC"
		 :non-normal-prefix "M-SPC"
		 "sl" '(org-schedule :which-key "scheduled task")
		 "dl" '(org-deadline :which-key "deadline task")
		 "ci" '(org-clock-in :which-key "clock in")
		 "co" '(org-clock-out :which-key "clock out")
		 )
		;; org agenda keybinds
	        (general-define-key
		 :keymaps 'org-agenda-mode-map
		 "l" 'org-agenda-later
		 "h" 'org-agenda-earlier
		 "j" 'org-agenda-next-line
		 "k" 'org-agenda-previous-line
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
(setq display-line-numbers-width 3)
(setq display-line-numbers-type 'relative)

;; Disable spash screen
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Highlight matching parenthesis
(show-paren-mode 1)

;; Add colors to the shell
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-to-list 'comint-output-filter-functions 'ansi-color-process-output)
(add-hook 'shell-mode-hook
      (lambda ()
        (face-remap-set-base 'comint-highlight-prompt :inherit nil)))

;; Persistent sessions
(desktop-save-mode 1)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-mode org-bullets which-key use-package telephone-line smart-mode-line pyenv-mode hl-todo helm general evil-surround evil-escape doom-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
