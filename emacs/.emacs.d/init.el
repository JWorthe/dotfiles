(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

(setq package-selected-packages '(systemd swiper ivy projectile racer restclient org-plus-contrib ensime scala-mode undo-tree emojify flycheck-rust web-beautify sass-mode rust-mode lsp-mode lsp-rust lsp-flycheck ox-reveal ox-gfm org-password-manager markdown-mode magit json-mode js2-mode sml-mode company company-racer company-lsp artbollocks-mode graphviz-dot-mode htmlize gnuplot ob-async counsel-projectile which-key god-mode kotlin-mode))

(setq package-enable-at-startup nil) ; To avoid initializing twice
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(package-install-selected-packages)


(setq my-org-base-path "~/doc/notebook/")
(setq my-org-journal (concat my-org-base-path "journal.org"))
(setq my-org-calendar (concat my-org-base-path "calendar.org"))

(setq org-agenda-files
      `(,(concat my-org-base-path "calendar.org") ,(concat my-org-base-path "contacts.org") ,(concat my-org-base-path "journal.org") ,(concat my-org-base-path "projects/") ,(concat my-org-base-path "maintenance/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(artbollocks-jargon nil)
 '(artbollocks-passive-voice nil)
 '(backup-directory-alist (quote (("." . "~/tmp/emacs/"))))
 '(c-default-style
   (quote
    ((c-mode . "stroustrup")
     (c++-mode . "stroustrup")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(company-idle-delay nil)
 '(company-lsp-enable-snippet nil)
 '(company-tooltip-align-annotations nil)
 '(custom-enabled-themes (quote (wombat)))
 '(custom-safe-themes
   (quote
    ("bb749a38c5cb7d13b60fa7fc40db7eced3d00aa93654d150b9627cabd2d9b361" default)))
 '(display-line-numbers nil)
 '(gdb-many-windows t)
 '(global-auto-revert-mode t)
 '(gnus-select-method (quote (nnml "")))
 '(graphviz-dot-indent-width 2)
 '(grep-highlight-matches nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(magit-diff-refine-hunk (quote all))
 '(mail-default-headers "BCC: justin@worthe-it.co.za")
 '(markdown-command "pandoc")
 '(menu-bar-mode nil)
 '(org-agenda-custom-commands
   (quote
    (("d" "Today"
      ((agenda ""
               ((org-agenda-overriding-header "Today")
                (org-agenda-span 1)
                (org-deadline-warning-days 0))))
      nil)
     ("u" "Unscheduled TODOs" tags-todo "-SCHEDULED={.+}-BLOCKED=\"t\"-ROUTINE-FUTURE"
      ((org-agenda-overriding-header "TODO")))
     ("w" "Week review"
      ((agenda ""
               ((org-agenda-overriding-header "This week")
                (org-agenda-span 8)
                (org-agenda-start-on-weekday 7)))
       (tags-todo "-SCHEDULED={.+}-BLOCKED=\"t\"-ROUTINE-FUTURE"
                  ((org-agenda-overriding-header "TODO"))))
      nil)
     ("y" "Year"
      ((agenda ""
               ((org-agenda-overriding-header "The Year Ahead")
                (org-agenda-span
                 (quote year))
                (org-deadline-warning-days 0)
                (org-agenda-show-future-repeats nil)
                (org-agenda-show-all-dates nil)
                (org-agenda-time-grid nil))))
      nil
      ("~/calendar.pdf")))))
 '(org-agenda-default-appointment-duration 60)
 '(org-agenda-exporter-settings (quote ((ps-landscape-mode t) (ps-number-of-columns 2))))
 '(org-agenda-hide-tags-regexp ".*")
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-start-on-weekday 7)
 '(org-capture-templates
   (quote
    (("t" "TODO" entry
      (file+headline my-org-journal "TODOs")
      "* TODO %^%?" :empty-lines-after 1 :kill-buffer t)
     ("s" "TODO Scheduled" entry
      (file+olp+datetree my-org-journal)
      "* TODO %^%?
  SCHEDULED: %t" :empty-lines-after 1 :time-prompt t :kill-buffer t)
     ("l" "Log" entry
      (file+olp+datetree my-org-journal)
      "* %U %^%?" :empty-lines-after 1 :kill-buffer t)
     ("c" "Calendar entry" entry
      (file+headline my-org-calendar "Capture")
      "* %^ 
  %^t
%?" :empty-lines-after 1 :kill-buffer t)
     ("w" "Week review" entry
      (file+olp+datetree my-org-journal)
      "* %u Week review 
# - How did my week go? Link to any stand out things. Celebrate
#   successes, blog posts, things that got done.
# - What did I learn this week? Will this change how I act going forward?
# - Who did I interact with? Any follow up needed?
# - Process any paper notes.
# - What am I excited for in the coming week?
# - Any questions that I want to figure out the answer to?
# - What are my goals / TODO items for the coming week?

%?" :jump-to-captured t :empty-lines-after 1))))
 '(org-confirm-babel-evaluate nil)
 '(org-contacts-icon-use-gravatar nil)
 '(org-contacts-vcard-file "/tmp/contacts.vcf")
 '(org-deadline-warning-days 0)
 '(org-enforce-todo-dependencies t)
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-from-is-user-regexp "\\<Justin Worthe\\>")
 '(org-goto-interface (quote outline-path-completion))
 '(org-icalendar-combined-agenda-file "/tmp/org.ics")
 '(org-icalendar-date-time-format ":%Y%m%dT%H%M%SZ")
 '(org-icalendar-include-todo t)
 '(org-icalendar-use-deadline (quote (event-if-not-todo event-if-todo todo-due)))
 '(org-icalendar-use-scheduled (quote (event-if-not-todo event-if-todo todo-start)))
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t
      ("pdflatex"))
     ("T1" "fontenc" t
      ("pdflatex"))
     ("" "graphicx" t nil)
     ("" "grffile" t nil)
     ("" "longtable" nil nil)
     ("" "wrapfig" nil nil)
     ("" "rotating" nil nil)
     ("normalem" "ulem" t nil)
     ("" "amsmath" t nil)
     ("" "textcomp" t nil)
     ("" "amssymb" t nil)
     ("" "capt-of" nil nil)
     ("colorlinks=true" "hyperref" nil nil))))
 '(org-log-repeat nil)
 '(org-outline-path-complete-in-steps nil)
 '(org-preview-latex-image-directory "/tmp/ltximg/")
 '(org-refile-targets
   (quote
    ((nil :maxlevel . 5)
     (org-agenda-files :maxlevel . 5))))
 '(org-refile-use-outline-path t)
 '(org-src-lang-modes
   (quote
    (("ocaml" . tuareg)
     ("elisp" . emacs-lisp)
     ("ditaa" . artist)
     ("asymptote" . asy)
     ("dot" . graphviz-dot)
     ("sqlite" . sql)
     ("calc" . fundamental)
     ("C" . c)
     ("cpp" . c++)
     ("C++" . c++)
     ("screen" . shell-script)
     ("shell" . sh)
     ("bash" . sh))))
 '(org-startup-folded nil)
 '(org-stuck-projects
   (quote
    ("+PROJECT+LEVEL=1/-DONE"
     ("TODO" "NEXT" "NEXTACTION")
     nil "")))
 '(org-todo-keywords (quote ((sequence "TODO" "|" "DONE" "CANCELLED"))))
 '(projectile-completion-system (quote ivy))
 '(projectile-mode t nil (projectile))
 '(projectile-use-git-grep t)
 '(ps-paper-type (quote a4))
 '(ps-print-color-p (quote black-white))
 '(ps-print-header nil)
 '(reb-re-syntax (quote string))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-default-smtp-server "worthe-it.co.za")
 '(smtpmail-smtp-server "worthe-it.co.za")
 '(smtpmail-smtp-service 465)
 '(smtpmail-stream-type (quote ssl))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh" nil (tramp))
 '(user-mail-address "justin@worthe-it.co.za"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#3d3d3d"))))
 '(company-scrollbar-fg ((t (:background "#303030"))))
 '(company-tooltip ((t (:inherit default :background "#292929"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-common-selection ((t (:inherit highlight))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-structure)))))

(set-face-attribute 'default nil :family "Hack" )

(setq org-agenda-default-appointment-duration 60)
(setq calendar-latitude -25.999180)
(setq calendar-longitude 28.126293)
(setq calendar-location-name "Midrand, South Africa")

;disable backup
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(global-undo-tree-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;(add-hook 'rust-mode-hook 'racer-mode)
;(add-hook 'racer-mode-hook 'eldoc-mode)


(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(setq lsp-rust-rls-command '("rustup" "run" "stable" "rls"))
(require 'lsp-mode)
(require 'lsp-rust)
(add-hook 'rust-mode-hook #'lsp-rust-enable)
(add-hook 'rust-mode-hook #'flycheck-mode)
(add-hook 'rust-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(require 'company-lsp)
(push 'company-lsp company-backends)

(require 'projectile)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(counsel-projectile-mode +1)

(projectile-register-project-type 'cargo '("Cargo.toml")
                  :compilation-dir "./"
                  :compile "cargo build"
                  :test "cargo test"
                  :run "cargo run")

(projectile-register-project-type 'jekyll '("index.html")
                  :compilation-dir "./"
                  :run "jekyll serve --drafts")

(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

(autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'LilyPond-mode "lilypond-mode")
(add-to-list 'auto-mode-alist '("\\.ly\\'" . LilyPond-mode))

(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
(setq sass-indent-offset 4)

(require 'ispell)

(setq epa-file-select-keys nil)

(add-hook 'org-mode-hook 'org-password-manager-key-bindings)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(global-set-key (kbd "C-x g") 'magit-status)

(require 'ox-reveal)
(require 'ox-gfm)

(require 'ob-rust "~/.emacs.d/ob-rust.el")
(require 'ob-shell)
(require 'ob-js)
(require 'ob-java)
(require 'ob-scala)
(require 'ob-dot)
(require 'ob-gnuplot)

(require 'ob-async)

(require 'org-contacts)

(put 'upcase-region 'disabled nil)

(require 'which-key)
(which-key-mode)
(which-key-enable-god-mode-support)
 
(require 'god-mode)
(global-set-key (kbd "<escape>") 'god-local-mode)


(defun eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))
