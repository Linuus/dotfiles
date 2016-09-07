;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/dotfiles/spacemacs-layers")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     elixir
     (elfeed :variables
             elfeed-feeds '(("http://sachachua.com/blog/category/emacs/feed/" emacs)
                            ("http://learningelixir.joekain.com/full-feed.xml" elixir)
                            ("http://blog.plataformatec.com.br/feed/" elixir)
                            ("http://planet.emacsen.org/atom.xml" emacs)))
     erc
     erlang
     git
     javascript
     latex
     osx
     restclient
     dash
     html
     markdown
     ruby
     ruby-on-rails
     org
     yaml
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 30
            shell-default-position 'bottom)
     syntax-checking
     version-control
     themes-megapack
     org-page
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner nil
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(base16-ocean-dark
                         leuven)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Hack"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
    It is called immediately after `dotspacemacs/init'.  You are free to put any user code."

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ERC CONFIG

  (spacemacs|use-package-add-hook erc
    :post-config
    (progn

      (defun erc-freenode-connect ()
        "Quick connect to irc.freenode.net"
        (interactive)
        ;; clean up old buffers if they exist
        (dolist (buf '("irc.freenode.net:6667" "#elixir-lang" "#qutebrowser"))
          (when (get-buffer buf) (kill-buffer buf)))
        (erc :server "irc.freenode.net"
             :port 6667
             :nick "Linuus"))

      (evil-leader/set-key
        "aif" 'erc-freenode-connect)

      ;; if imagemagick isn't supported, we don't want inline images
      (unless (fboundp 'imagemagick-types)
        (setq erc-modules (-remove-item 'image erc-modules)))

      (setq erc-autojoin-channels-alist
            '(("freenode.net" "#elixir-lang" "#qutebrowser"))
            erc-hide-list '("JOIN" "PART" "QUIT" "NICK" "MODE" "353")
            erc-track-exclude-types '("JOIN" "PART" "QUIT" "NICK" "MODE" "353")
            erc-track-exclude-server-buffer t
            erc-track-position-in-mode-line t
            erc-join-buffer 'bury
            erc-hl-nicks-minimum-contrast-ratio 2.5
            erc-hl-nicks-color-contrast-strategy '(invert contrast)
            erc-fill-column 120
            erc-fill-function 'erc-fill-static
            erc-fill-static-center 20
            erc-current-nick-highlight-type 'all
            erc-log-insert-log-on-open nil
            erc-track-shorten-aggressively 'max)
            ;; erc-prompt-for-nickserv-password nil
            ;; erc-enable-sasl-auth t
            ;; erc-sasl-server-regexp-list '("irc\\.freenode\\.net"))

      (add-hook 'erc-mode-hook 'turn-off-show-smartparens-mode)))

  ;; END ERC CONFIG
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  )


(defun dotspacemacs/user-config ()

  (defmacro linus/remove-from-list (list-var element)
    `(setq ,list-var (remove ,element ,list-var)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; INDENTATION

  ;; major-mode specific indent levels
  (setq default-indent-level 2)
  (setq ruby-indent-level 2)
  (setq css-indent-level 2)
  (setq js-indent-level 2)
  (setq web-mode-markup-indent-offset 2)

  (setq javascript-indent-level 2) ; javascript-mode

  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2) ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2) ; web-mode, js code in html file
  (setq css-indent-offset 2) ; css-mode

  (setq-default
   ruby-version-manager 'rbenv
   ruby-insert-encoding-magic-comment nil)

  (add-hook 'web-mode-hook
            (function (lambda ()
                        (setq evil-shift-width default-indent-level))))

  (add-hook 'ruby-mode-hook
            (function (lambda ()
                        (setq evil-shift-width default-indent-level))))

  (add-hook 'js-mode-hook
            (function (lambda ()
                        (setq evil-shift-width js-indent-level))))

  ;; END INDENTATION
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; ORG CONFIG

  (with-eval-after-load 'org
    (setq org-startup-indented t)
    (setq org-clock-mode-line-total 'today)

    (spacemacs/toggle-mode-line-org-clock-on)

    (setq org-agenda-files (quote ("~/Dropbox (Personal)/Notes/personal.org"
                                   "~/Dropbox (Personal)/Notes/work.org")))

    ;; don't show tasks that are scheduled or have deadlines in the
    ;; global todo list
    (setq org-agenda-todo-ignore-deadlines (quote all))
    (setq org-agenda-todo-ignore-scheduled (quote all))

    (setq org-refile-targets '((org-agenda-files :maxlevel . 2)))

    ;; format string used when creating CLOCKSUM lines and when generating a
    ;; time duration (avoid showing days)
    (setq org-time-clocksum-format
          '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


    (org-babel-do-load-languages
     'org-babel-load-languages
     '((ruby . t)
       (shell . t)))
    )

  (setq org-agenda-custom-commands
        '(("p" "Personal stuff" tags-todo "CATEGORY=\"PERSONAL\"")
          ("w" "Work related" ((agenda "")
                               (tags-todo "CATEGORY=\"WORK\"")))
          ("n" "Agenda and all TODOs" ((agenda "") (alltodo "")))
          ))

  (setq org-capture-templates
        '(("r" "To read" entry (file+headline "~/Dropbox (Personal)/Notes/personal.org" "Reading list")
           "* %?\n  %i")))

  ;; END ORG CONFIG
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  (dolist (mode '(erc-mode
                  comint-mode
                  term-mode
                  eshell-mode))
    (linus/remove-from-list evil-insert-state-modes mode))

  (let ((comint-hooks '(eshell-mode-hook
                        term-mode-hook
                        erc-mode-hook
                        messages-buffer-mode-hook
                        comint-mode-hook)))
    (spacemacs/add-to-hooks (defun linus/no-hl-line-mode ()
                              (setq-local global-hl-line-mode nil))
                            comint-hooks)
    (spacemacs/add-to-hooks (defun linus/no-scroll-margin ()
                              (setq-local scroll-margin 0))
                            comint-hooks))

  (setq evil-move-beyond-eol nil)
  (setq powerline-default-separator 'slant)
  (global-linum-mode)
  (linum-relative-toggle)
  (blink-cursor-mode t)

  (spacemacs|diminish alchemist-mode "Ⓐ" "A")
  (spacemacs|diminish alchemist-phoenix-mode "Ⓠ" "Q")
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
