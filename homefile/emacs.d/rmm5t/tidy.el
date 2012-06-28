<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: tidy.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=tidy.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: tidy.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=tidy.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for tidy.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=tidy.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22tidy.el%22">tidy.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="http://www.emacswiki.org/emacs/download/tidy.el">Download</a></p><pre class="code"><span class="linecomment">;;; tidy.el --- Interface to the HTML Tidy program</span>

<span class="linecomment">;; Copyright (C) 2001, 2002, 2003 by Free Software Foundation, Inc.</span>

<span class="linecomment">;; Emacs Lisp Archive Entry</span>
<span class="linecomment">;; Filename: tidy.el</span>
<span class="linecomment">;; Author: Kahlil (Kal) HODGSON &lt;dorge@tpg.com.au&gt;</span>
<span class="linecomment">;; X-URL: http://www.emacswiki.org/elisp/tidy.el</span>
<span class="linecomment">;; Time-stamp: &lt;2002-09-30 13:16:23 kahlil&gt;</span>
<span class="linecomment">;; Version: 2.12</span>
<span class="linecomment">;; Keywords: languages</span>

<span class="linecomment">;; This file is NOT part of GNU Emacs.</span>

<span class="linecomment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This file is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with GNU Emacs; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,</span>
<span class="linecomment">;; Boston, MA 02111-1307, USA.</span>

<span class="linecomment">;;;; Commentary:</span>

<span class="linecomment">;; Provides a simple interface to the HTML Tidy program -- a free</span>
<span class="linecomment">;; utility that can fix common errors in your mark-up and clean up</span>
<span class="linecomment">;; sloppy editing automatically. See</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;       &lt;http://tidy.sourceforge.net/&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; for more details.  This package provides the following functions:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;;       `tidy-buffer',</span>
<span class="linecomment">;;       `tidy-parse-config-file',</span>
<span class="linecomment">;;       `tidy-save-settings', and</span>
<span class="linecomment">;;       `tidy-describe-options',</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; These can be invoked interactively (using M-x) or via the menu-bar.</span>
<span class="linecomment">;; The function `tidy-buffer' sends the current buffer to HTML Tidy,</span>
<span class="linecomment">;; replacing the existing contents with a "tidied" version.  If</span>
<span class="linecomment">;; `tidy-buffer' is given a prefix argument, tidy operates on the</span>
<span class="linecomment">;; current region, ignoring mark-up outside &lt;BODY&gt;...&lt;/BODY&gt; tags</span>
<span class="linecomment">;; (useful for writhing cgi scripts in Pearl).  Warnings and errors</span>
<span class="linecomment">;; are presented in a compilation buffer to facilitate tracking down</span>
<span class="linecomment">;; necessary changes (e.g. C-x ` is bound to `next-error').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; This package also provides menu-bar support for setting Tidy's many</span>
<span class="linecomment">;; options, and includes support for Tidy configuration files.  The</span>
<span class="linecomment">;; function `tidy-parse-config-file' will synchronise options</span>
<span class="linecomment">;; displayed in the menu-bar with the settings in `tidy-config-file'.</span>
<span class="linecomment">;; This is normally called by the load-hook for your HTML editing mode</span>
<span class="linecomment">;; (see installation instructions below).  The function</span>
<span class="linecomment">;; `tidy-save-settings' will save the current option settings to your</span>
<span class="linecomment">;; `tidy-config-file'.  Finally `tidy-describe-options' allows you to</span>
<span class="linecomment">;; browse the documentation strings associated with each option.</span>

<span class="linecomment">;;;</span>

<span class="linecomment">;;;; Installation:</span>

<span class="linecomment">;; This package assumes you have and up-to-date HTML Tidy program</span>
<span class="linecomment">;; installed on your system.  See the URL above for instructions on</span>
<span class="linecomment">;; how to do this.  To set up this support package, first place the</span>
<span class="linecomment">;; "tidy.el" file somewhere in your `load-path' and open it in Emacs.</span>
<span class="linecomment">;; Byte-compile and load this package using the command</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; M-x emacs-lisp-byte-compile-and-load &lt;RET&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Next customise the variables `tidy-config-file', `tidy-temp-dir'</span>
<span class="linecomment">;; `tidy-shell-command', `tidy-menu-lock' and `tidy-menu-x-position'</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; M-x customize-group &lt;RET&gt; tidy &lt;RET&gt;</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Now add the following autoloads to your ".emacs.el" file:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (autoload 'tidy-buffer "tidy" "Run Tidy HTML parser on current buffer" t)</span>
<span class="linecomment">;; (autoload 'tidy-parse-config-file "tidy" "Parse the `tidy-config-file'" t)</span>
<span class="linecomment">;; (autoload 'tidy-save-settings "tidy" "Save settings to `tidy-config-file'" t)</span>
<span class="linecomment">;; (autoload 'tidy-build-menu  "tidy" "Install an options menu for HTML Tidy." t)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; If you use html-mode to edit HTML files then add something like</span>
<span class="linecomment">;; this as well</span>

<span class="linecomment">;; (defun my-html-mode-hook () "Customize my html-mode."</span>
<span class="linecomment">;;   (tidy-build-menu html-mode-map)</span>
<span class="linecomment">;;   (local-set-key [(control c) (control c)] 'tidy-buffer)</span>
<span class="linecomment">;;   (setq sgml-validate-command "tidy"))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (add-hook 'html-mode-hook 'my-html-mode-hook)</span>

<span class="linecomment">;; This will set up a "tidy" menu in the menu bar and bind the key</span>
<span class="linecomment">;; sequence "C-c C-c" to `tidy-buffer' in html-mode (normally bound to</span>
<span class="linecomment">;; `validate-buffer').</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; For other modes (like html-helper-mode) simple change the variables</span>
<span class="linecomment">;; `html-mode-hook' and `html-mode-map' to whatever is appropriate e.g.</span>

<span class="linecomment">;; (defun my-html-mode-hook () "Customize my html-helper-mode."</span>
<span class="linecomment">;;   (tidy-build-menu html-helper-mode-map)</span>
<span class="linecomment">;;   (local-set-key [(control c) (control c)] 'tidy-buffer)</span>
<span class="linecomment">;;   (setq sgml-validate-command "tidy"))</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; (add-hook 'html-helper-mode-hook 'my-html-mode-hook)</span>

<span class="linecomment">;; Finally, restart Emacs and open an HTML file to test-drive the tidy</span>
<span class="linecomment">;; package. For people new to HTML tidy check that the option "markup"</span>
<span class="linecomment">;; under the "Input/Output" sub menu is set. You can read the</span>
<span class="linecomment">;; documentation on this option via the menu item "Describe Options".</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Enjoy!</span>

<span class="linecomment">;;;; New Features:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 0. Now compatible with CVS version of Tidy as at 22 May 2003</span>
<span class="linecomment">;; 1. Improved menu support to facillitate incorporting new options</span>
<span class="linecomment">;; 2. Menu lock option makes menu stick when toggling options.</span>
<span class="linecomment">;; 3. Now runs on XEmacs!!</span>
<span class="linecomment">;; 4. Uses error file rather than std-error to retrieve errors (this</span>
<span class="linecomment">;;    fixes some odd pop up behaviour)</span>
<span class="linecomment">;; 5. minor bug fix (empty config files)</span>
<span class="linecomment">;; 6. handle buffer modified query in error buffer better</span>
<span class="linecomment">;; 7. make it impossible to mark the error buffer as modified</span>
<span class="linecomment">;; 8. Added the variable `tidy-temp-directory'.</span>
<span class="linecomment">;; 9. Bugfix in tidy-buffer: call find-file-noselect with NOWARN</span>

<span class="linecomment">;;;; ToDo:</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; 1. Automatically set "char-encoding" according to the buffer encoding</span>
<span class="linecomment">;; 2. Should check value of HTML_TIDY environment variable.</span>


<span class="linecomment">;;;; Bugs:</span>

<span class="linecomment">;; Requires a version of HTML Tidy that understands the "-f"</span>
<span class="linecomment">;; "-config" "--show-body-only" command line options e.g. source-forge</span>
<span class="linecomment">;; pre-release.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; There may be a bug with setting doctypes.  I don't use this feature</span>
<span class="linecomment">;; yet and, well, don't really know how its supposed to work:-)</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Care with character encodings!!</span>

<span class="linecomment">;;;; Credits</span>

<span class="linecomment">;; This code was inspired by an Emacs "tip" suggested by Pete Gelbman.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Hans-Michael Stahl for comments regarding XEmacs</span>
<span class="linecomment">;; compatibility.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Thomas Baumann for bugfix's in `tidy-parse-config-file'</span>
<span class="linecomment">;; and `tidy-buffer'.</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Chris Lott for comments regarding installation and menu</span>
<span class="linecomment">;; display</span>
<span class="linecomment">;;</span>
<span class="linecomment">;; Thanks to Jeroen Baekelandt for noting a problem with ange-ftp and</span>
<span class="linecomment">;; inspiring `tidy-temp-directory'.</span>

<span class="linecomment">;;;; Code:</span>

<span class="linecomment">;;;;; Forward references (stuff which must come first)</span>

(require 'easymenu) <span class="linecomment">;; This makes menus so much easier!</span>
(require 'compile)  <span class="linecomment">;; To make the error buffer more sexy</span>

<span class="linecomment">;; The following two are functions so that the same compiled code will</span>
<span class="linecomment">;; work in both situations (time cost is negligible)</span>

(defsubst tidy-xemacs-p ()
  "<span class="quote">Return t iff we are running XEmacs this session.</span>"
  (not (null (string-match "<span class="quote">^XEmacs.*</span>" (emacs-version)))))

(defsubst tidy-windows-p ()
  "<span class="quote">Return t iff we are running on a Windows system.</span>"
  (memq system-type '(emx win32 w32 mswindows ms-dos windows-nt)))

<span class="linecomment">;; function definitions</span>

<span class="linecomment">;; XEmacs</span>
(defalias 'tidy-x-event-function          'event-function)
(defalias 'tidy-x-event-object            'event-object)
(defalias 'tidy-x-find-menu-item          'find-menu-item)
(defalias 'tidy-x-get-popup-menu-response 'get-popup-menu-response)
(defalias 'tidy-x-make-event              'make-event)
(defalias 'tidy-x-misc-user-event-p       'misc-user-event-p)

<span class="linecomment">;;;;; User Variables</span>

(defgroup tidy nil
"<span class="quote">*Provides a simple interface to the HTML Tidy program -- a free
utility that can fix common errors in your mark-up and clean up
sloppy editing automatically. See

      &lt;http://tidy.sourceforge.net/&gt;

for more details.  This package provides the following functions:

      `tidy-buffer',
      `tidy-parse-config-file',
      `tidy-save-settings', and
      `tidy-describe-options',

These can be invoked interactively (using M-x) or via the menu-bar.
The function `tidy-buffer' sends the current buffer to HTML Tidy,
replacing the existing contents with a \"tidied\" version.  If
`tidy-buffer' is given a prefix argument, tidy operates on the
current region, ignoring mark-up outside &lt;BODY&gt;...&lt;/BODY&gt; tags
\(useful for writhing cgi scripts in Pearl).  Warnings and errors
are presented in a compilation buffer to facilitate tracking down
necessary changes (e.g. C-x ` is bound to `next-error').

This package also provides menu-bar support for setting Tidy's many
options, and includes support for Tidy configuration files.  The
function `tidy-parse-config-file' will synchronise options
displayed in the menu-bar with the settings in `tidy-config-file'.
This is normally called by the load-hook for your HTML editing mode
\(see installation instructions below).  The function
`tidy-save-settings' will save the current option settings to your
`tidy-config-file'.  Finally `tidy-describe-options' allows you to
browse the documentation strings associated with each option.
</span>")


(defcustom tidy-config-file "<span class="quote">~/.tidyrc</span>"
  "<span class="quote">*Path to your default tidy configuration file.

This is used by `tidy-parse-config-file' to synchronise Tidy's behaviour
inside Emacs with its behaviour outside, and by `tidy-save-settings' to
set your configuration file from within Emacs.  If you never want this to
happen, set `tidy-config-file' to nil.</span>"
  :group 'tidy
  :type 'string)

(defcustom tidy-shell-command "<span class="quote">/usr/bin/tidy</span>"
  "<span class="quote">*Full path to command to call HTML tidy from a shell.</span>"
  :group 'tidy
  :type 'string)

(defcustom tidy-temp-directory "<span class="quote">.</span>"
  "<span class="quote">Directory where tidy places its temp files.  The default is the
current directory which works fine unless you are operating on remote
files via `ange-ftp' and its ilk, in which case it will try to place
the temp files on the remote server (and will probably fail).  If this
is the case try setting this variable to something like \"/tmp/\" or
\"/var/tmp/\".</span>"
  :group 'tidy
  :type 'string)

(defcustom tidy-menu-lock t
  "<span class="quote"> *Non-nil means menu is locked (i.e. doesn't pop down) when
selecting toggle and radio options.

See also `tidy-menu-x-position'.</span>"
  :type 'boolean
  :group 'tidy)

(defcustom tidy-menu-x-position 211
  "<span class="quote">*Specify menu position height in pixels.

This variable is used to set the horizontal position of the locked
menu, so don't forget to adjust it if menu position is not ok.

See also `tidy-menu-lock'.</span>"
  :type 'integer
  :group 'tidy)

<span class="linecomment">;;;;; Local Variables</span>

(defvar tidy-debug  nil
  "<span class="quote">If t then we rebuild everything on reload. Useful for debugging.</span>")

<span class="linecomment">;;(eval-when-compile (setq tidy-debug t))</span>

(defun tidy-toggle-debug () "<span class="quote">Toggle value of tidy-debug.</span>"
  (interactive)
  (message "<span class="quote">tidy-debug is %s</span>" (setq tidy-debug (not tidy-debug))))

(defvar tidy-options-alist nil
  "<span class="quote">An alist containing all valid tidy options.
Each element is a list of the form
    (NAME, SUB-MENU, VALUE-TYPE, DEFAULT-VALUE, DOC-STRING).
This is used to automatically construct variables and a menu bar.
To add new or modify exiting options simply modify this list.</span>")

(when (or (null tidy-options-alist) tidy-debug)
  (setq tidy-options-alist
	'(
	  ("<span class="quote">add-xml-decl</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should add the XML declaration when
outputting XML or XHTML. Note that if the input already includes an &lt;?xml
... ?&gt; declaration then this option will be ignored.</span>")

	  ("<span class="quote">add-xml-pi</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option is the same as the add-xml-decl option.</span>")

	  ("<span class="quote">add-xml-space</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should add xml:space=\"preserve\" to elements
such as &lt;PRE&gt;, &lt;STYLE&gt; and &lt;SCRIPT&gt; when generating XML. This is needed if
the whitespace in such elements is to be parsed appropriately without
having access to the DTD.</span>")

	  ("<span class="quote">alt-text</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">String</span>" "<span class="quote"></span>"
	   "<span class="quote">
Type: String
Default: -none-

This option specifies the default \"alt=\" text Tidy uses for &lt;IMG&gt;
attributes. This feature is dangerous as it suppresses further
accessibility warnings. You are responsible for making your documents
accessible to people who can not see the images!</span>")

	  ("<span class="quote">ascii-chars</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

Can be used to modify behavior of -c (--clean yes) option.
Defaults to \"yes\" when using -c. Set to \"no\" to prevent
converting &emdash;, &rdquo;, and other named character entities
to their ascii equivalents.</span>")

	  ("<span class="quote">assume-xml-procins</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should change the parsing of processing
instructions to require ?&gt; as the terminator rather than &gt;. This option is
automatically set if the input is in XML.</span>")

	  ("<span class="quote">bare</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should strip Microsoft specific HTML from
Word 2000 documents, and output spaces rather than non-breaking spaces
where they exist in the input.</span>")

	  ("<span class="quote">break-before-br</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output a line break before each &lt;BR&gt;
element.</span>")

	  ("<span class="quote">char-encoding</span>" "<span class="quote">Encoding</span>" "<span class="quote">Encoding</span>" "<span class="quote">ascii</span>"
	   "<span class="quote">
Type: Encoding
Default: ascii
Example: ascii, latin1, raw, utf8, iso2022, mac, win1252

This option specifies the character encoding Tidy uses for both the input
and output. Possible values are: ascii, latin1, raw, utf8, iso2022, mac,
win1252. For ascii, Tidy will accept Latin-1 (ISO-8859-1) character
values, but will use entities for all characters whose value &gt; 127. For
raw, Tidy will output values above 127 without translating them into
entities. For latin1, characters above 255 will be written as
entities. For utf8, Tidy assumes that both input and output is encoded as
UTF-8. You can use iso2022 for files encoded using the ISO-2022 family of
encodings e.g. ISO-2022-JP. For mac and win1252, Tidy will accept vendor
specific character values, but will use entities for all characters whose
value &gt; 127.</span>")

	  ("<span class="quote">clean</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should strip out surplus presentational tags
and attributes replacing them by style rules and structural markup as
appropriate. It works well on the HTML saved by Microsoft Office products.</span>")

	  ("<span class="quote">doctype</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">DocType</span>" "<span class="quote">auto</span>"
	   "<span class="quote">
Type: DocType
Default: auto
Example: auto, omit, strict, loose, transitional, user specified fpi \(string\)

This option specifies the DOCTYPE declaration generated by Tidy. If set to
\"omit\" the output won't contain a DOCTYPE declaration. If set to \"auto\"
\(the default\) Tidy will use an educated guess based upon the contents of
the document. If set to \"strict\", Tidy will set the DOCTYPE to the strict
DTD. If set to \"loose\", the DOCTYPE is set to the loose \(transitional\)
DTD. Alternatively, you can supply a string for the formal public
identifier \(FPI\). For example:

      doctype: \"-//ACME//DTD HTML 3.14159//EN\"

If you specify the FPI for an XHTML document, Tidy will set
the system identifier to the empty string. Tidy leaves the DOCTYPE for
generic XML documents unchanged.</span>")

	  ("<span class="quote">drop-empty-paras</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should discard empty paragraphs. If set to
no, empty paragraphs are replaced by a pair of &lt;BR&gt; elements as HTML4
precludes empty paragraphs.</span>")

	  ("<span class="quote">drop-font-tags</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should discard &lt;FONT&gt; and &lt;CENTER&gt; tags
rather than creating the corresponding style rules, but only if the clean
option is also set to yes.</span>")

	  ("<span class="quote">drop-proprietary-attributes</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should strip out proprietary attributes,
such as MS data binding attributes.</span>")

	  ("<span class="quote">enclose-block-text</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should insert a &lt;P&gt; element to enclose any
text it finds in any element that allows mixed content for HTML
transitional but not HTML strict.</span>")

	  ("<span class="quote">enclose-text</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should enclose any text it finds in the body
element within a &lt;P&gt; element. This is useful when you want to take
existing HTML and use it with a style sheet.</span>")

	  ("<span class="quote">error-file</span>" "<span class="quote">Omit</span>" "<span class="quote">String</span>" "<span class="quote">-none-</span>"
	   "<span class="quote">
Type: String
Default: -none-

This option specifies the error file Tidy uses for errors and
warnings. Normally errors and warnings are output to \"stderr\".

This is option is ignored in Emacs.</span>")

	  ("<span class="quote">escape-cdata</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should convert &lt;![CDATA[]]&gt; sections to
normal text.</span>")

	  ("<span class="quote">fix-backslash</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should replace backslash characters \"\\\" in
URLs by forward slashes \"/\".</span>")

	  ("<span class="quote">fix-bad-comments</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should replace unexpected hyphens with \"=\"
characters when it comes across adjacent hyphens. The default is yes. This
option is provided for users of Cold Fusion which uses the comment syntax:
&lt;!--- ---&gt;</span>")

	  ("<span class="quote">fix-uri</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should check attribute values that carry
URIsfor illegal characters and if such are found, escape them as HTML 4
recommends.</span>")

	  ("<span class="quote">force-output</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should produce output even if errors are
encountered. Use this option with care - if Tidy reports an error,
this means Tidy was not able to, or is not sure how to, fix the error,
so the resulting output may not reflect your intention.</span>")

	  ("<span class="quote">gnu-emacs</span>" "<span class="quote">Omit</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should change the format for reporting
errors and warnings to a format that is more easily parsed by GNU
Emacs.

This option is automatically set in Emacs.</span>"  )

	  ("<span class="quote">hide-comments</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should print out comments.</span>")

	  ("<span class="quote">hide-endtags</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should omit optional end-tags when
generating the pretty printed markup. This option is ignored if you are
outputting to XML.</span>")

	  ("<span class="quote">indent</span>" "<span class="quote">Indentation</span>" "<span class="quote">AutoBool</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: AutoBool
Default: no
Example: auto, y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should indent block-level tags.  If set to
\"auto\", this option causes Tidy to decide whether or not to indent the
content of tags such as TITLE, H1-H6, LI, TD, TD, or P depending on whether
or not the content includes a block-level element. You are advised to avoid
setting indent to yes as this can expose layout bugs in some browsers.</span>")

	  ("<span class="quote">indent-attributes</span>" "<span class="quote">Indentation</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should begin each attribute on a new line.</span>")

	  ("<span class="quote">indent-cdata</span>" "<span class="quote">Indent</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should indent &lt;![CDATA[]]&gt; sections.</span>")

	  ("<span class="quote">indent-spaces</span>" "<span class="quote">Indentation</span>" "<span class="quote">Integer</span>" "<span class="quote">2</span>"
	   "<span class="quote">
Type: Integer
Default: 2
Example: 0, 1, 2, ...

This option specifies the number of spaces Tidy uses to indent content,
when indentation is enabled.</span>")

	  ("<span class="quote">input-encoding</span>" "<span class="quote">Encoding</span>" "<span class="quote">Encoding</span>" "<span class="quote">latin1</span>"
	   "<span class="quote">
Type: Encoding
Default: ascii
Example: ascii, latin1, raw, utf8, iso2022, mac, win1252

This option specifies the character encoding Tidy uses for the input. See
char-encoding for more info.</span>")

	  ("<span class="quote">input-xml</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should use the XML parser rather than the
error correcting HTML parser.</span>")

	  ("<span class="quote">join-classes</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should combine class names to generate a
single new class name, if multiple class assignments are detected on an
element.</span>")

	  ("<span class="quote">join-styles</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should combine styles to generate a single
new style, if multiple style values are detected on an element.</span>")

	  ("<span class="quote">keep-time</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should alter the last modified time for
files it writes back to. The default is no, which allows you to tidy files
without affecting which ones will be uploaded to a Web server when using a
tool such as 'SiteCopy'. Note that this feature may not work on some
platforms.</span>")

	  ("<span class="quote">literal-attributes</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should ensure that whitespace characters
within attribute values are passed through unchanged.</span>")

	  ("<span class="quote">logical-emphasis</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should replace any occurrence of &lt;I&gt; by &lt;EM&gt;
and any occurrence of &lt;B&gt; by &lt;STRONG&gt;. In both cases, the attributes are
preserved unchanged. This option can be set independently of the clean and
drop-font-tags options.</span>")

	  ("<span class="quote">lower-literals</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should convert the value of an attribute
that takes a list of predefined values to lower case. This is required for
XHTML documents.</span>")

	  ("<span class="quote">markup</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should generate a pretty printed version of
the markup. Note that Tidy won't generate a pretty printed version if it
finds significant errors (see force-output).</span>")

	  ("<span class="quote">ncr</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should allow numeric character references.</span>")

	  ("<span class="quote">new-blocklevel-tags</span>" "<span class="quote">Tags</span>" "<span class="quote">Tag names</span>" "<span class="quote"></span>"
	   "<span class="quote">
Type: Tag names
Default: -none-
Example: tagX, tagY, ...

This option specifies new block-level tags. This option takes a space or
comma separated list of tag names. Unless you declare new tags, Tidy will
refuse to generate a tidied file if the input includes previously unknown
tags. Note you can't change the content model for elements such as
&lt;TABLE&gt;, &lt;UL&gt;, &lt;OL&gt; and &lt;DL&gt;.</span>")

	  ("<span class="quote">new-empty-tags</span>" "<span class="quote">Tags</span>" "<span class="quote">Tag names</span>" "<span class="quote"></span>"
	   "<span class="quote">
Type: Tag names
Default: -none-
Example: tagX, tagY, ...

This option specifies new empty inline tags. This option takes a space or
comma separated list of tag names. Unless you declare new tags, Tidy will
refuse to generate a tidied file if the input includes previously unknown
tags. Remember to also declare empty tags as either inline or blocklevel.</span>")

	  ("<span class="quote">new-inline-tags</span>" "<span class="quote">Tags</span>" "<span class="quote">Tag names</span>" "<span class="quote"></span>"
	   "<span class="quote">
Type: Tag names
Default: -none-
Example: tagX, tagY, ...

This option specifies new non-empty inline tags. This option takes a space
or comma separated list of tag names. Unless you declare new tags, Tidy
will refuse to generate a tidied file if the input includes previously
unknown tags.</span>")

	  ("<span class="quote">new-pre-tags</span>" "<span class="quote">Tags</span>" "<span class="quote">Tag names</span>" "<span class="quote"></span>"
	   "<span class="quote">
Type: Tag names
Default: -none-
Example: tagX, tagY, ...

This option specifies new tags that are to be processed in exactly the
same way as HTML's &lt;PRE&gt; element. This option takes a space or comma
separated list of tag names. Unless you declare new tags, Tidy will refuse
to generate a tidied file if the input includes previously unknown
tags. Note you can not as yet add new CDATA elements (similar to
&lt;SCRIPT&gt;).</span>")

	  ("<span class="quote">numeric-entities</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output entities other than the
built-in HTML entities \(&amp;, &lt;, &gt; and &quot;\) in the numeric
rather than the named entity form.</span>")

	  ("<span class="quote">output-bom</span>" "<span class="quote">Encoding</span>" "<span class="quote">AutoBool</span>" "<span class="quote">auto</span>"
	   "<span class="quote">
Type: AutoBool
Default: auto
Example: auto, y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should write a Unicode Byte Order Mark
character (BOM; also known as Zero Width No-Break Space; has value of
U+FEFF) to the beginning of the output; only for UTF-8 and UTF-16 output
encodings. If set to \"auto\", this option causes Tidy to write a BOM to the
output only if a BOM was present at the beginning of the input. A BOM is
always written for XML/XHTML output using UTF-16 output encodings.</span>")

	  ("<span class="quote">output-encoding</span>" "<span class="quote">Encoding</span>" "<span class="quote">Encoding</span>" "<span class="quote">ascii</span>"
	   "<span class="quote">
Type: Encoding
Default: ascii
Example: ascii, latin1, raw, utf8, iso2022, mac, win1252

This option specifies the character encoding Tidy uses for the output. See
char-encoding for more info. May only be different from input-encoding for
Latin encodings (ascii, latin1, mac, win1252).</span>")

	  ("<span class="quote">output-xhtml</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should generate pretty printed output,
writing it as extensible HTML. This option causes Tidy to set the DOCTYPE
and default namespace as appropriate to XHTML. If a DOCTYPE or namespace
is given they will checked for consistency with the content of the
document. In the case of an inconsistency, the corrected values will
appear in the output. For XHTML, entities can be written as named or
numeric entities according to the setting of the \"numeric-entities\"
option.  The original case of tags and attributes will be preserved,
regardless of other options.</span>")

	  ("<span class="quote">output-xml</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should pretty print output, writing it as
well-formed XML. Any entities not defined in XML 1.0 will be written as
numeric entities to allow them to be parsed by a XML parser. The original
case of tags and attributes will be preserved, regardless of other
options.</span>")

	  ("<span class="quote">quiet</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output the summary of the numbers of
errors and warnings, or the welcome or informational messages.</span>")

	  ("<span class="quote">quote-ampersand</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output unadorned & characters as
&amp;.</span>")

	  ("<span class="quote">quote-marks</span>" "<span class="quote">Preference</span>"  "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output \" characters as &quot; as is
preferred by some editing environments. The apostrophe character \' is
written out as &#39; since many web browsers don't yet support &apos;.</span>")

	  ("<span class="quote">quote-nbsp</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output non-breaking space characters
as entities, rather than as the Unicode character value 160 (decimal).</span>")

	  ("<span class="quote">raw</span>" "<span class="quote">Omit</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0 char-encoding

Currently not used, but this option would be the same as the
char-encoding: raw option.</span>")

	  ("<span class="quote">repeated-attributes</span>" "<span class="quote">Fix Markup</span>" ("<span class="quote">keep-first</span>" "<span class="quote">keep-last</span>") "<span class="quote">keep-last</span>"
	   "<span class="quote">
Type: -
Default: keep-last
Example: keep-first, keep-last

This option specifies if Tidy should keep the first or last attribute, if
an attribute is repeated, e.g. has two align attributes.</span>")


	  ("<span class="quote">replace-color</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should replace numeric values in color
attributes by HTML/XHTML color names where defined, e.g. replace
\"#ffffff\" with \"white\".</span>"  )

	  ("<span class="quote">slide-style</span>" "<span class="quote">Omit</span>" "<span class="quote">String</span>"
	   "<span class="quote">
Type: Name
Default: -none-
split Currently not used.</span>")

	  ("<span class="quote">show-body-only</span>" "<span class="quote">Omit</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should print only the contents of the body
tag as an HTML fragment. Useful for incorporating existing whole pages as
a portion of another page.

Emacs overrides this option.</span>")

	  ("<span class="quote">show-errors</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Integer</span>" "<span class="quote">6</span>"
	   "<span class="quote">
Type: Integer
Default: 6
Example: 0, 1, 2, ...

This option specifies the number Tidy uses to determine if further errors
should be shown. If set to 0, then no errors are shown.</span>")

	  ("<span class="quote">show-warnings</span>" "<span class="quote">Input/Output</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should suppress warnings. This can be useful
when a few errors are hidden in a flurry of warnings.</span>")

	  ("<span class="quote">slide-style</span>" "<span class="quote">Omit</span>" "<span class="quote">String</span>" "<span class="quote"></span>"
	   "<span class="quote">
Type: Name
Default: -none-

Currently not used.</span>")

	  ("<span class="quote">split</span>" "<span class="quote">Omit</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	    "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should create a sequence of slides from
the input, splitting the markup prior to each successive &lt;H2&gt;. The
slides are written to \"slide001.html\", \"slide002.html\" etc.

There is currently no Emacs support for this option.</span>")

	  ("<span class="quote">tab-size</span>" "<span class="quote">Indentation</span>" "<span class="quote">Integer</span>" "<span class="quote">4</span>"
	   "<span class="quote">
Type: Integer
Default: 4
Example: 0, 1, 2, ...

This option specifies the number of columns that Tidy uses between
successive tab stops. It is used to map tabs to spaces when reading the
input. Tidy never outputs tabs.</span>")

	  ("<span class="quote">tidy-mark</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should add a meta element to the document
head to indicate that the document has been tidied. Tidy won't add a meta
element if one is already present.</span>")

	  ("<span class="quote">uppercase-attributes</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output attribute names in upper
case. The default is no, which results in lower case attribute names,
except for XML input, where the original case is preserved.</span>")

	  ("<span class="quote">uppercase-tags</span>" "<span class="quote">Preference</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should output tag names in upper case. The
default is no, which results in lower case tag names, except for XML
input, where the original case is preserved.</span>")

	  ("<span class="quote">word-2000</span>" "<span class="quote">Fix Markup</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should go to great pains to strip out all
the surplus stuff Microsoft Word 2000 inserts when you save Word documents
as \"Web pages\".  Doesn't handle embedded images or VML.</span>")

	  ("<span class="quote">wrap</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Integer</span>" "<span class="quote">68</span>"
	   "<span class="quote">
Type: Integer
Default: 68
Example: 0, 1, 2, ...

This option specifies the right margin Tidy uses for line wrapping. Tidy
tries to wrap lines so that they do not exceed this length. Set wrap to
zero if you want to disable line wrapping.</span>")

	  ("<span class="quote">wrap-asp</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should line wrap text contained within ASP
pseudo elements, which look like: &lt;% ... %&gt;.</span>")

	  ("<span class="quote">wrap-attributes</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should line wrap attribute values, for
easier editing. This option can be set independently of
wrap-script-literals.</span>")

	  ("<span class="quote">wrap-jste</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should line wrap text contained within JSTE
pseudo elements, which look like: &lt;# ... #&gt;.</span>")

	  ("<span class="quote">wrap-php</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should line wrap text contained within PHP
pseudo elements, which look like: &lt;?php ... ?&gt;.</span>")

	  ("<span class="quote">wrap-script-literals</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should line wrap string literals that appear
in script attributes. Tidy wraps long script string literals by inserting
a backslash character before the line break.</span>")

	  ("<span class="quote">wrap-sections</span>" "<span class="quote">Line Wrapping</span>" "<span class="quote">Boolean</span>" "<span class="quote">yes</span>"
	   "<span class="quote">
Type: Boolean
Default: yes
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should line wrap text contained within
&lt;![... ]&gt; section tags.</span>")

	  ("<span class="quote">write-back</span>" "<span class="quote">Omit</span>" "<span class="quote">Boolean</span>" "<span class="quote">no</span>"
	   "<span class="quote">
Type: Boolean
Default: no
Example: y/n, yes/no, t/f, true/false, 1/0

This option specifies if Tidy should write back the tidied markup to
the same file it read from. You are advised to keep copies of
important files before tidying them, as on rare occasions the result
may not be what you expect.

This option is ignored by Emacs.</span>")
	  ))
  )

<span class="linecomment">;;;;; Create a variable for each option in `tidy-options-alist'"</span>

<span class="linecomment">;; these variables are made buffer local so that different buffers can</span>
<span class="linecomment">;; use a different set of options</span>

(let ((options-alist tidy-options-alist)
      option name symbol docstring)

  (while (setq option (car options-alist))
    (setq name      (nth 0 option)
	  docstring (nth 4 option)
	  symbol    (intern (concat "<span class="quote">tidy-</span>" name)))
    <span class="linecomment">;; create the variable on the fly</span>
    (put symbol 'variable-documentation docstring)
    (make-variable-buffer-local symbol)
    (set symbol nil) <span class="linecomment">;;default)</span>
    (setq options-alist (cdr options-alist))
    )
  )

<span class="linecomment">;;;;; Menu Lock (adapted from printing.el)</span>

<span class="linecomment">;; quite compiler</span>
(eval-when-compile
  (progn
	 (or (boundp 'current-menubar)
	     (defvar current-menubar nil))
	 (or (fboundp 'tidy-menu-position)
	     (defun  tidy-menu-position () "<span class="quote"></span>"))
	 (or (fboundp 'tidy-menu-lock)
	     (defun tidy-menu-lock (entry state path) "<span class="quote"></span>"))
	 (or (fboundp 'tidy-menu-lookup)
	     (defun tidy-menu-lookup (path) "<span class="quote"></span>"))
	 ))

<span class="linecomment">;; always define these</span>
(defvar tidy-menu-position nil)
(defvar tidy-menu-state nil)

(cond
 ((tidy-xemacs-p)
  <span class="linecomment">;; XEmacs</span>
  (defun tidy-menu-position ()
    (tidy-x-make-event
     'button-release
     (list 'button 1
	   'x tidy-menu-x-position
	   'y -5
	   )))

  <span class="linecomment">;; XEmacs</span>
  (defun tidy-menu-lock (entry state path)
    (when (and (not (interactive-p)) tidy-menu-lock)
      (or (and tidy-menu-position (eq state tidy-menu-state))
	  (setq tidy-menu-position (tidy-menu-position)
		tidy-menu-state    state))
      (let* ((menu   (tidy-menu-lookup path))
	     (result (tidy-x-get-popup-menu-response menu tidy-menu-position)))
	(and (tidy-x-misc-user-event-p result)
	     (funcall (tidy-x-event-function result)
		      (tidy-x-event-object result))))
      (setq tidy-menu-position nil)))

  <span class="linecomment">;; XEmacs</span>
  (defun tidy-menu-lookup (path)
    (car (tidy-x-find-menu-item current-menubar (cons "<span class="quote">Tidy</span>" path)))))

 (t
    <span class="linecomment">;; GNU Emacs</span>
  (defun tidy-menu-position ()
    (let ()
      (list (list tidy-menu-x-position '-5)
	    (selected-frame))))		<span class="linecomment">; frame</span>

  <span class="linecomment">;; GNU Emacs</span>
  (defun tidy-menu-lock (entry state path)
    (when (and (not (interactive-p)) tidy-menu-lock)
      (or (and tidy-menu-position (eq state tidy-menu-state))
	  (setq tidy-menu-position (tidy-menu-position )
		tidy-menu-state    state))
      (let* ((menu   (tidy-menu-lookup path))
	     (result (x-popup-menu tidy-menu-position menu)))
	(and result
	     (let ((command (lookup-key menu (vconcat result))))
	       (if (fboundp command)
		   (funcall command)
		 (eval command)))))
      (setq tidy-menu-position nil)))

  <span class="linecomment">;; GNU Emacs</span>
  (defun tidy-menu-lookup (dummy)
    (lookup-key (current-local-map) [menu-bar Tidy])))
 )

<span class="linecomment">;;;;; Define classes of menu items</span>

(defun tidy-set (var-sym value mess entry state &optional path)
  "<span class="quote">Set the value of the symbol VAR-SYM to VALUE giving a message
derived from VALUE and MESS.  Pass on menu data to `tidy-menu-lock'.</span>"
  (set var-sym value)
  (message "<span class="quote">%s is %s</span>" mess value)
  (tidy-menu-lock entry state path))

(defun tidy-boolean-entry (symbol name type default menu)
  "<span class="quote">Returns a menu entry that allows us to toggle the value of SYMBOL.
SYMBOL refers to the option called NAME which has default value
DEFAULT.  TYPE should always have the value \"Boolean\".  MENU refers
to the sub-menu that this item belongs to and POSITION its position in
that list.</span>"
  (cond ((equal default "<span class="quote">no</span>")
	 (list (vector name
		       (list 'tidy-set (list 'quote symbol)
			     (list 'if symbol 'nil "<span class="quote">yes</span>")
			     name
			     (list 'quote menu)
			     '(quote toggle)
			     )
		       :style 'toggle
		       :selected (list 'if symbol 't 'nil))))

	((equal default "<span class="quote">yes</span>")
	 (list (vector name (list 'tidy-set (list 'quote symbol)
				  (list 'if symbol 'nil "<span class="quote">no</span>")
				  name
				  (list 'quote menu)
				  '(quote toggle)
				  )
		       :style 'toggle
		       :selected (list 'if symbol 'nil 't))))))

(defun tidy-list-entry (symbol name type default menu)
"<span class="quote">Returns a menu entry that allows us to set via a radio button the
value of SYMBOL.  SYMBOL refers to the option called NAME which has
default value DEFAULT.  TYPE should be a list of the possible
values. MENU refers to the sub-menu that this item belongs to and
POSITION its position in that list.</span>"
  (let (value element)
      (while (setq value (car type))
	(if (equal value default)
	    (setq element
		  (append element
			  (list
			   (vector
			    (concat name "<span class="quote"> is \"</span>" value "<span class="quote">\"</span>")
			    (list 'tidy-set (list 'quote symbol)
				  (list 'if symbol 'nil value)
				  name
				  (list 'quote menu)
				  '(quote toggle)
				  )
			    :style 'radio
			    :selected (list 'if symbol 'nil 't)
			    ))))
	  (setq element
		(append element
			(list
			 (vector
			  (concat name "<span class="quote"> is \"</span>" value "<span class="quote">\"</span>")

			  (list 'tidy-set (list 'quote symbol)
				(list 'if symbol 'nil value)
				name
				(list 'quote menu)
				'(quote toggle)
				)

			  :style 'radio
			  :selected (list
				     'if (list 'string-equal symbol value)
				     't 'nil)
			 )))))
	(setq type (cdr type)))
	element))

(defun tidy-set-string (symbol name default)
  "<span class="quote">Set the value of SYMBOL identified by name to VALUE,
unless VALUE equals DEFAULT, in which case we set it to nil.</span>"
  (interactive)
  (let* ((last-value (symbol-value symbol))
	 (new-value
	  (if (tidy-xemacs-p)
	      (read-string (format "<span class="quote">Set %s to: </span>" name)
			   (or last-value default) nil) <span class="linecomment">;; no default arg</span>
	    (read-string (format "<span class="quote">Set %s to: </span>" name)
			 (or last-value default) nil default))))
    (set symbol (if (equal new-value default) nil new-value))))

(defun tidy-set-integer (symbol name default)
  "<span class="quote">Set the value of SYMBOL identified by name to VALUE,
unless VALUE = DEFAULT, in which case we set it to nil.</span>"
  (interactive)
  (let* ((last-value (symbol-value symbol))
	 <span class="linecomment">;; careful to interpret the string as a number</span>
	 (new-value
	  (string-to-number
	   (if (tidy-xemacs-p)
	       (read-string (format "<span class="quote">Set %s to: </span>" name)
		(or last-value default) nil)
	     (read-string (format "<span class="quote">Set %s to: </span>" name)
		(or last-value default) nil default)
	     ))))
	 (set symbol (if (= new-value (string-to-number default)) nil
		       (number-to-string new-value)))))


(defun tidy-string-entry (symbol name type default menu)
  "<span class="quote">Returns a menu entry that allows us to set the value of SYMBOL.
SYMBOL refers to the option called NAME which has default value
DEFAULT.  TYPE should always be one of \"String\" \"Tags\", or
\"DocType\".  MENU and POSITION are not used in this case.</span>"

  (list (vector (concat "<span class="quote">set </span>" name)
		(list 'tidy-set-string
		      (list 'quote symbol)
		      name default))))

(defun tidy-integer-entry (symbol name type default menu)
"<span class="quote">Returns a menu entry that allows us to set the value of SYMBOL.
SYMBOL refers to the option called NAME which has default value
DEFAULT.  TYPE should always have the value \"Integer\". MENU and
POSITION are not used in this case. </span>"
  (list (vector (concat "<span class="quote">set </span>" name)
		(list 'tidy-set-integer
		      (list 'quote symbol)
		      name default))))

(defvar tidy-top-menu nil
  "<span class="quote">The first part of teh menu.</span>")
(when (or (null tidy-top-menu) tidy-debug)
  (setq tidy-top-menu
	'("<span class="quote">Tidy</span>"
	  ["<span class="quote">Tidy buffer</span>" tidy-buffer
	   :active (and tidy-shell-command <span class="linecomment">;; check that tidy can be executed</span>
			(file-executable-p (car (split-string tidy-shell-command))))]

	  ["<span class="quote">Tidy region</span>" (tidy-buffer 1)
	   :active (and tidy-shell-command <span class="linecomment">;; check that tidy can be executed</span>
			(file-executable-p (car (split-string tidy-shell-command))))
	   :keys "<span class="quote">C-u \\[tidy-buffer]</span>"]

	  "<span class="quote">----------------------------------------------</span>"

	  ["<span class="quote">Parse config file</span>" tidy-parse-config-file
	   :active (and tidy-config-file (file-exists-p tidy-config-file))]

	  ["<span class="quote">Save settings</span>" tidy-save-settings
	   :active (and tidy-config-file (file-exists-p tidy-config-file))]

	  "<span class="quote">----------------------------------------------</span>"

	  ["<span class="quote">Menu Lock</span>" (tidy-set 'tidy-menu-lock
				 (if tidy-menu-lock nil t)
				 "<span class="quote">Menu Lock</span>"
				 'top
				 'toggle)
	   :style toggle
	   :selected (if tidy-menu-lock t nil)
	   ]
	  )))

(defvar tidy-doctype-menu nil "<span class="quote">The second to last sub-menu.</span>")
(when (or (null tidy-doctype-menu) tidy-debug)
  (setq  tidy-doctype-menu
	 '("<span class="quote">Set doctype</span>" <span class="linecomment">;; ==&gt;</span>

	   ["<span class="quote">auto</span>"   (tidy-set 'tidy-doctype
			       nil
			       "<span class="quote">doctype</span>"
			       'doctype
			       'toggle)
	    :style radio
	    :selected (if (null tidy-doctype)  t nil)]

	   ["<span class="quote">omit</span>"   (tidy-set 'tidy-doctype
			       "<span class="quote">omit</span>"
			       "<span class="quote">doctype</span>"
			       'doctype
			       'toggle)
	    :style radio
	    :selected (if (equal tidy-doctype "<span class="quote">omit</span>") t nil)]

	   ["<span class="quote">strict</span>" (tidy-set 'tidy-doctype
			       "<span class="quote">strict</span>"
			       "<span class="quote">doctype</span>"
			       'doctype
			       'toggle)
	    :style radio
	    :selected (if (equal tidy-doctype "<span class="quote">strict</span>") t nil)]

	   ["<span class="quote">loose</span>"  (tidy-set 'tidy-doctype
			       "<span class="quote">loose</span>"
			       "<span class="quote">doctype</span>"
			       'doctype
			       'toggle)
	    :style radio
	    :selected (if (equal tidy-doctype "<span class="quote">loose</span>") t nil)]

	   ["<span class="quote">transitional</span>"  (tidy-set 'tidy-doctype
				      "<span class="quote">transitional</span>"
				      "<span class="quote">doctype</span>"
				      'doctype
				      'toggle)
	    :style radio
	    :selected (if (equal tidy-doctype "<span class="quote">transitional</span>") t nil)]

	   ["<span class="quote">fpi</span>" (null nil) <span class="linecomment">;; stub function</span>
	    :style radio
	    :selected (if (or (null tidy-doctype)
			      (equal tidy-doctype "<span class="quote">omit</span>")
			      (equal tidy-doctype "<span class="quote">strict</span>")
			      (equal tidy-doctype "<span class="quote">loose</span>"))
			  nil t) ]

	   ["<span class="quote">reset fpi</span>" (tidy-set-string 'tidy-doctype "<span class="quote">doctype</span>" "<span class="quote"></span>" "<span class="quote"></span>")]
	   )))

(defvar tidy-char-encoding-menu nil "<span class="quote">The last sub-menu.</span>")
(when (or (null tidy-char-encoding-menu) tidy-debug)
  (setq tidy-char-encoding-menu
	'("<span class="quote">Set char-encoding</span>" <span class="linecomment">;; ==&gt;</span>
	  ["<span class="quote">ascii</span>"   (tidy-set 'tidy-char-encoding
			       nil
			       "<span class="quote">char-encoding</span>"
			       'encoding
			       'toggle)
	   :style radio
	   :selected (if (null tidy-char-encoding) t nil) <span class="linecomment">;; default</span>
	   ]

	  ["<span class="quote">raw</span>"     (tidy-set 'tidy-char-encoding
			       "<span class="quote">raw</span>"
			       "<span class="quote">char-encoding</span>"
			       'encoding
			       'toggle)
	   :style radio
	   :selected (if (equal tidy-char-encoding "<span class="quote">raw</span>") t nil)]

	  ["<span class="quote">latin1</span>"  (tidy-set 'tidy-char-encoding
			       "<span class="quote">latin1</span>"
			       "<span class="quote">char-encoding</span>"
			       'encoding
			       'toggle)
	   :style radio
	   :selected (if (equal tidy-char-encoding "<span class="quote">latin1</span>") t nil)]

	  ["<span class="quote">utf8</span>"    (tidy-set 'tidy-char-encoding
			       "<span class="quote">utf8</span>"
			       "<span class="quote">char-encoding</span>"
			       'encoding
			       'toggle)
	   :style radio
	   :selected (if (equal tidy-char-encoding "<span class="quote">utf8</span>") t nil)]

	  ["<span class="quote">iso2022</span>" (tidy-set 'tidy-char-encoding
			       "<span class="quote">iso2022</span>"
			       "<span class="quote">char-encoding</span>"
			       'encoding
			       'toggle)
	   :style radio
	   :selected (if (equal tidy-char-encoding "<span class="quote">iso2022</span>") t nil)]

	  ["<span class="quote">mac</span>" (tidy-set 'tidy-char-encoding
			   "<span class="quote">mac</span>"
			   "<span class="quote">char-encoding</span>"
			   'encoding
			   'toggle)
	   :style radio
	   :selected (if (equal tidy-char-encoding "<span class="quote">mac</span>") t nil)]

	  ["<span class="quote">win1252</span>" (tidy-set 'tidy-char-encoding
			       "<span class="quote">win1252</span>"
			       "<span class="quote">char-encoding</span>"
			       'encoding
			       'toggle)
	   :style radio
	   :selected (if (equal tidy-char-encoding "<span class="quote">win1252</span>") t nil)]

	  )))

<span class="linecomment">;;;;; Create a menu item for each option that has a valid sub-menu</span>
<span class="linecomment">;; field</span>

(defvar tidy-menu nil "<span class="quote">Menu used by tidy.</span>")
(when (or (null tidy-menu) tidy-debug)
  (let ((options-alist       tidy-options-alist)

	<span class="linecomment">;; sub menus are divided into two parts with list type options</span>
	<span class="linecomment">;; coming first, followed by the rest</span>

	markup-menu-bool     markup-menu-set
	line-wrap-menu-bool  line-wrap-menu-set
	preference-menu-bool preference-menu-set
	indent-menu-bool     indent-menu-set
	io-menu-bool         io-menu-set
	tags-menu-bool       tags-menu-set

	name sub-menu type default symbol entry entry-function option)

    (while (setq option (car options-alist))
      (setq name      (nth 0 option)
	    sub-menu  (nth 1 option)
	    type      (nth 2 option)
	    default   (nth 3 option)
	    symbol    (intern (concat "<span class="quote">tidy-</span>" name))
	    entry     nil)

      (cond ((equal type "<span class="quote">Boolean</span>")
	     (setq entry-function 'tidy-boolean-entry))

	    ((equal type "<span class="quote">AutoBool</span>")
	     (setq entry-function 'tidy-list-entry)
	     (setq type '("<span class="quote">auto</span>" "<span class="quote">yes</span>" "<span class="quote">no</span>")))

	    ((equal type "<span class="quote">DocType</span>")
	     (setq entry '())) <span class="linecomment">;; handled below</span>

	    ((equal type "<span class="quote">Tag names</span>")
	     (setq entry-function 'tidy-string-entry))

	    ((equal type "<span class="quote">String</span>")
	     (setq entry-function 'tidy-string-entry))

	    ((equal type "<span class="quote">Integer</span>")
	     (setq entry-function 'tidy-integer-entry))

	    ((equal type "<span class="quote">Encoding</span>")
	     (setq entry '()))<span class="linecomment">;; handled below</span>

	    ((listp type)
	     (setq entry-function 'tidy-list-entry))
	    (t
	     (error (concat "<span class="quote">Tidy: unhandled value type </span>" type "<span class="quote"> for </span>" name))))

      (cond ((equal sub-menu "<span class="quote">Fix Markup</span>")
	     (setq entry (funcall
			  entry-function
			  symbol
			  name
			  type
			  default
			  'markup))

	     (if (or (equal type "<span class="quote">Boolean</span>") (equal type "<span class="quote">AutoBool</span>") (listp type))
		 (setq markup-menu-bool (append markup-menu-bool entry))
	       (setq markup-menu-set (append markup-menu-set entry))))

	    ((equal sub-menu "<span class="quote">Indentation</span>")
	     (setq entry (funcall
			  entry-function
			  symbol
			  name
			  type
			  default
			  'indent))

	     (if (or (equal type "<span class="quote">Boolean</span>") (equal type "<span class="quote">AutoBool</span>") (listp type))
		 (setq indent-menu-bool (append indent-menu-bool entry))
	       (setq indent-menu-set (append indent-menu-set entry))))

	    ((equal sub-menu "<span class="quote">Line Wrapping</span>")
	     (setq entry (funcall
			  entry-function
			  symbol
			  name
			  type
			  default
			  'line-wrap))

	     (if (or (equal type "<span class="quote">Boolean</span>") (equal type "<span class="quote">AutoBool</span>") (listp type))
		 (setq line-wrap-menu-bool (append line-wrap-menu-bool entry))
	       (setq line-wrap-menu-set (append line-wrap-menu-set entry))))

	    ((equal sub-menu "<span class="quote">Input/Output</span>")
	     (setq entry (funcall
			  entry-function
			  symbol
			  name
			  type
			  default
			  'io))

	     (if (or (equal type "<span class="quote">Boolean</span>") (equal type "<span class="quote">AutoBool</span>") (listp type))
		 (setq io-menu-bool (append io-menu-bool entry))
	       (setq io-menu-set (append io-menu-set entry))))

	    ((equal sub-menu "<span class="quote">Preference</span>")
	     (setq entry (funcall
			  entry-function
			  symbol
			  name
			  type
			  default
			  'preference))

	     (if (or (equal type "<span class="quote">Boolean</span>") (equal type "<span class="quote">AutoBool</span>") (listp type))
		 (setq preference-menu-bool (append preference-menu-bool entry))
	       (setq preference-menu-set (append preference-menu-set entry))))

	    ((equal sub-menu "<span class="quote">Tags</span>")
	     (setq entry (funcall
			  entry-function
			  symbol
			  name
			  type
			  default
			  'tags))

	     (if (or (equal type "<span class="quote">Boolean</span>") (equal type "<span class="quote">AutoBool</span>"))
	     (setq tags-menu-bool (append tags-menu-bool entry))
	     (setq tags-menu-set (append tags-menu-set entry))))
	    (t)) <span class="linecomment">;; we simple omit all other menus</span>

      (setq options-alist (cdr options-alist)))

  (setq tidy-menu (append
		   tidy-top-menu
		   (list (append (list "<span class="quote">Fix Markup</span>")
			       markup-menu-bool
			       markup-menu-set))
		   (list (append  (list "<span class="quote">Line Wrapping</span>")
			       line-wrap-menu-bool
			       line-wrap-menu-set))
		   (list (append (list "<span class="quote">Preference</span>")
			       preference-menu-bool
			       preference-menu-set))
		   (list (append (list "<span class="quote">Indentation</span>")
			       indent-menu-bool
			       indent-menu-set))
		   (list (append(list "<span class="quote">Input/Output</span>")
			       io-menu-bool
			       io-menu-set))
		   (list (append (list "<span class="quote">Tags</span>")
			       tags-menu-bool
			       tags-menu-set))
		   (list tidy-doctype-menu)
		   (list tidy-char-encoding-menu)
		   '(["<span class="quote">Describe options</span>" tidy-describe-options t])))
  )
)

<span class="linecomment">;;;###autoload</span>
(defun tidy-build-menu (&optional map)
  "<span class="quote">Set up the tidy menu in MAP. Used to set up a Tidy menu in your
favourite mode.</span>"
  (interactive) <span class="linecomment">;; for debugging</span>
  (or map (setq map (current-local-map)))
  (tidy-parse-config-file)
  (easy-menu-remove tidy-menu)
  (easy-menu-define tidy-menu-symbol map "<span class="quote">Menu for tidy.el</span>" tidy-menu)
  (easy-menu-add tidy-menu map))

<span class="linecomment">;;;;; Option description support</span>

<span class="linecomment">;; quiet FSF Emacs and XEmacs compilers</span>
(eval-when-compile
  (progn (or (fboundp 'event-point) (defun event-point (dummy) "<span class="quote"></span>"))
	 (or (fboundp 'posn-point)  (defun posn-point  (dummy) "<span class="quote"></span>"))
	 (or (fboundp 'event-start) (defun event-start (dummy) "<span class="quote"></span>"))))

(defun tidy-describe-this-option (click)
  "<span class="quote">Describe variable associated with the text at point.</span>"
  (interactive "<span class="quote">e</span>")

  (let* ((variable (get-text-property
		    (if (tidy-xemacs-p)
			(event-point click)
		      (posn-point (event-start click))) 'tidy-variable))
	 value
	 buffer) <span class="linecomment">;; reuse the help buffer</span>
    (when variable
      (save-selected-window
	(setq value (symbol-value variable)
	      buffer (get-buffer-create "<span class="quote">*Help*</span>"))
	(set-buffer buffer)
	(setq buffer-read-only nil)
	(delete-region (point-min) (point-max)) <span class="linecomment">;; empty the buffer</span>
	(insert (substring (symbol-name variable) 5) <span class="linecomment">;; clip the `tidy-' prefix</span>
		"<span class="quote"> is set to </span>")
	(if value (insert value) (insert "<span class="quote">set to the default value</span>"))

	(insert "<span class="quote">\n\n</span>" (documentation-property variable 'variable-documentation))
	(setq buffer-read-only t)
	(local-set-key [(q)] 'tidy-quit-describe-options)
	(pop-to-buffer buffer)))))

(defun tidy-quit-describe-options ()
"<span class="quote">Rid thyself of any display associated with Tidy's options.</span>"
  (interactive)
  (bury-buffer (get-buffer "<span class="quote">*tidy-options*</span>"))
  (delete-windows-on (get-buffer "<span class="quote">*tidy-options*</span>"))
  (bury-buffer (get-buffer "<span class="quote">*Help*</span>"))
  (delete-windows-on (get-buffer "<span class="quote">*Help*</span>")))

<span class="linecomment">;; nicked this from cal-desk-calendar.el:-)</span>
(defun tidy-current-line ()
  "<span class="quote">Get the current line number (in the buffer) of point.</span>"
  (interactive)
  (save-restriction
    (widen)
    (save-excursion
      (beginning-of-line)
      (1+ (count-lines 1 (point))))))

(defun tidy-describe-options ()
  "<span class="quote">Interactively access documentation strings for `tidy-' variables.</span>"
  (interactive)
  (let ((buffer (get-buffer "<span class="quote">*tidy-options*</span>")))
    (if buffer (pop-to-buffer buffer)
      <span class="linecomment">;; else build it from scratch</span>
      (setq buffer (get-buffer-create "<span class="quote">*tidy-options*</span>"))
      (let* ((start 0)
	    (end 0)
	    name
	    (count 0)
	    (option-alist tidy-options-alist)
	    (column2a (+ (length "<span class="quote">drop-proprietary-attributes</span>") 3))
	    (column2b (/ (window-width) 3))
	    (column2 (if (&gt; column2a column2b) column2a column2b))
	    (column3 (* 2 column2))
	    (start-line 0)
	    (third-length 0)
	    (two-third-length 0))

	(set-buffer buffer)

	(setq buffer-read-only nil)
	(delete-region (point-min) (point-max)) <span class="linecomment">;; empty the buffer</span>

	<span class="linecomment">;; set up local bindings</span>
	(if (tidy-xemacs-p)
	    (local-set-key [(button2)] 'tidy-describe-this-option)
	  (local-set-key [(mouse-2)] 'tidy-describe-this-option))

	(local-set-key [(q)] 'tidy-quit-describe-options)

	(insert "<span class="quote">Click [mouse-2] over option to see its description.  </span>"
		"<span class="quote">Type \"q\" to quit.</span>" "<span class="quote">\n\n</span>")

	(setq start-line (tidy-current-line))
	(setq third-length (1+ (/ (length option-alist) 3) ))
	(setq two-third-length (1- (* 2 third-length)))

	(while (setq name (car (car-safe option-alist)))
	  (setq option-alist (cdr option-alist))
	  (setq count (+ count 1))

	  (cond
	   ((&lt; count third-length)     <span class="linecomment">;; 0 &lt;= count &lt; third-length</span>
	    (setq start (point))
		(insert name)
		(setq end (point))
		(insert "<span class="quote">\n</span>"))
	   ((&lt; count two-third-length) <span class="linecomment">;; third-length &lt;= count &lt; two-third-length</span>
	    (if (= count third-length)
		(goto-line start-line)
	      (forward-line 1))
	    (end-of-line)
	    (setq start (point))
	    (indent-to-column column2)
	    (setq end (point))
	    (put-text-property start end 'mouse-face 'default)
	    (setq start (point))
	    (insert name)
	    (setq end (point)))
	   (t                          <span class="linecomment">;; two-third-length &lt;= count &lt; length</span>
	    (if (= count two-third-length)
		(goto-line start-line)
	      (forward-line 1))
	    (end-of-line)
	    (setq start (point))
	    (indent-to-column column3)
	    (setq end (point))
	    (put-text-property start end 'mouse-face 'default)
	    (setq start (point))
	    (insert name)
	    (setq end (point))))

	  <span class="linecomment">;; make the strings funky</span>
	  (put-text-property start end 'mouse-face 'highlight)
	  (put-text-property start end 'tidy-variable (intern (concat "<span class="quote">tidy-</span>" name)))
	  )
	(setq buffer-read-only t)
	(beginning-of-buffer)
	(pop-to-buffer buffer)
	))))

<span class="linecomment">;;;;; Configuration file support</span>

<span class="linecomment">;;;###autoload</span>
(defun tidy-parse-config-file ()
  "<span class="quote">If `tidy-config-file' is non-nil parse that file setting variables accordingly.</span>"
  (interactive)
  (when tidy-config-file
    (if (not (file-exists-p tidy-config-file))
	(message "<span class="quote">Could not find config file \"%s\".  Winging it.</span>" tidy-config-file)
      (message "<span class="quote">Parsing config file...</span>")
      (let ((html-buffer (current-buffer))
	    (config-buffer (find-file-noselect tidy-config-file t)))
	(save-excursion
	  (set-buffer config-buffer)
	  (goto-char (point-min)) <span class="linecomment">;; unnecessary but pedantic</span>

	  <span class="linecomment">;; delete all comments</span>
	  (while (re-search-forward "<span class="quote">//.*\n</span>" nil t)
	    (replace-match "<span class="quote"></span>" nil nil))

	  (goto-char (point-min))
	  (while (re-search-forward "<span class="quote">\\([a-z,-]+\\):\\s-*\\(.*\\)\\s-*</span>" nil t)
	    <span class="linecomment">;; set the variable</span>
	    <span class="linecomment">;; Thanks to Thomas Baumann for this bugfix</span>
	    (let ((variable (concat "<span class="quote">tidy-</span>" (match-string 1)))
		  (value (match-string 2)))
	      (save-excursion
		(set-buffer html-buffer)
		(set (intern variable) value))))

	  (set-buffer-modified-p nil) <span class="linecomment">;; don't save changes</span>
	  (kill-buffer config-buffer)))
      (message "<span class="quote">Parsing config file...done</span>")
      )))

<span class="linecomment">;;;###autoload</span>
(defun tidy-save-settings (&optional config-file)
  "<span class="quote">Query saving the current settings to your `tidy-config-file'.
Perhaps put this on your `kill-buffer-hook'.</span>"
  (interactive)
  (or config-file (setq config-file tidy-config-file))
  (when config-file

    <span class="linecomment">;; should check for locks!</span>
    (if (or (not (interactive-p))
            (y-or-n-p "<span class="quote">Save settings to your tidy configuration file? </span>"))

        (let ((buffer (find-file-noselect config-file t))
              (option-alist tidy-options-alist)
              (outer-buffer (current-buffer))
              option name symbol value)
          (save-excursion
            (set-buffer buffer)
            (delete-region (point-min) (point-max)) <span class="linecomment">;; clear the buffer</span>

            <span class="linecomment">;; need this line so that config file is always non empty</span>
            (insert "<span class="quote">// HTML Tidy configuration file \n</span>")
            (while (setq option (car option-alist))
              (setq option-alist (cdr option-alist))
              (setq name      (nth 0 option)
                    symbol    (intern (concat "<span class="quote">tidy-</span>" name)))
              (save-excursion <span class="linecomment">;; this is a local variable</span>
                (set-buffer outer-buffer)
                (setq value (symbol-value symbol)))
              (when value <span class="linecomment">;; nil iff default</span>
                (insert (car option) "<span class="quote">: </span>" value "<span class="quote">\n</span>")))

            (save-buffer)
            (kill-buffer buffer)
            )))))


<span class="linecomment">;;;;; Main user function</span>

(eval-when-compile (defvar tidy-markup nil "<span class="quote"></span>"))

(defun tidy-set-buffer-unmodified (dummy1 dummy2 dumm3)
  "<span class="quote">Used to prevent error buffer form being marked as modified.</span>"
  (set-buffer-modified-p nil))

<span class="linecomment">;;;###autoload</span>
(defun tidy-buffer (&optional prefix)
  "<span class="quote">Run the HTML Tidy program on the current buffer.
If PREFIX is non-nil, or if called interactively with a prefix argument,
then Tidy is applied to the currently selected region.  Any error messages
generated by that program are sent to \"*tidy-errors*\" buffer.</span>"

  (interactive "<span class="quote">P</span>")

  (let* ((start (if (null prefix) (point-min) (mark)))
	 (end   (if (null prefix) (point-max) (point)))
	 (filename (file-name-nondirectory (buffer-file-name (current-buffer))))
	 <span class="linecomment">;; Gasp! We have to use temp files here because the command</span>
	 <span class="linecomment">;; line would likely get too long!</span>

	 (error-file (concat
		      <span class="linecomment">;; name may or may not end in "/"</span>
		      (directory-file-name tidy-temp-directory)
		      "<span class="quote">/temp-tidy-errors</span>"))

	 (error-buffer (get-buffer error-file))

	 (temp-buffer "<span class="quote"> *tidy-temp*</span>") <span class="linecomment">;; invisible</span>

	 (config-file (concat
		       <span class="linecomment">;; name may or may not end in "/"</span>
		       (directory-file-name tidy-temp-directory)
		       "<span class="quote">/temp-tidy-config</span>"))

	 (command (concat tidy-shell-command
			  <span class="linecomment">;; load configuration file first so that</span>
			  <span class="linecomment">;; options are overridden by command line</span>
			  "<span class="quote"> -config </span>" config-file
			  "<span class="quote"> --error-file </span>" error-file
			  "<span class="quote"> --write-back no</span>"
			  (if prefix "<span class="quote"> --show-body-only yes</span>"
			    "<span class="quote"> --show-body-only no</span>")
			  "<span class="quote"> --gnu-emacs yes</span>"
			  "<span class="quote"> --gnu-emacs-file \"</span>" filename "<span class="quote">\"</span>"
			  ))
	 (errors 0)
	 (warnings 0)
	 (tidy-message "<span class="quote"></span>")
	 (seg-error nil))

    (if (&gt; start end) (setq end (mark) start (point))) <span class="linecomment">;; rare case swap</span>

    (when error-buffer <span class="linecomment">;; flush the error buffer</span>
      (save-excursion
	(set-buffer error-buffer)
	(set-buffer-modified-p nil)
	(kill-buffer error-buffer)))

    (when (get-buffer temp-buffer) <span class="linecomment">;; flush the temp buffer</span>
      (save-excursion
	(set-buffer temp-buffer)
	(delete-region (point-min) (point-max))))

    (tidy-save-settings config-file)

    <span class="linecomment">;; OK do the tidy</span>
    (shell-command-on-region start end command temp-buffer nil)

    <span class="linecomment">;; Since XEmacs can't grab the std error stream we use an error file</span>
    (setq error-buffer (find-file-noselect error-file t))

    <span class="linecomment">;; avoid leaving theses guys lying around</span>
    (if (file-exists-p error-file)  (delete-file error-file))
    (if (file-exists-p config-file) (delete-file config-file))

    <span class="linecomment">;; scan the buffer for error strings</span>
    (save-excursion
      (set-buffer error-buffer)
      (goto-char (point-min))
      (when (re-search-forward (concat
				"<span class="quote">\\([0-9]+\\) warnings?, </span>"
				"<span class="quote">\\([0-9]+\\) errors? were found!</span>")
			       nil t)
	(setq warnings (string-to-number (match-string 1)))
	(setq errors (string-to-number (match-string 2)))
	(setq tidy-message (match-string 0)))

      (goto-char (point-min))
      (while (re-search-forward "<span class="quote">stdin:</span>" nil t)
	(replace-match (concat filename "<span class="quote">:</span>")))
      (setq buffer-read-only t)
      (compilation-mode)
      <span class="linecomment">;; don't save changes</span>
      (set-buffer-modified-p nil)
      <span class="linecomment">;; Unfortunately as soon as you do `next-error' this will change</span>
      <span class="linecomment">;; the buffer again (setting text properties), so we make it</span>
      <span class="linecomment">;; impossible to mark this buffer as modified by setting the</span>
      <span class="linecomment">;; following buffer local variable:</span>
      (make-variable-buffer-local 'after-change-functions)
      (add-hook 'after-change-functions 'tidy-set-buffer-unmodified t t)
      <span class="linecomment">;;      (remove-hook 'after-change-functions 'tidy-set-buffer-unmodified t)</span>
      (goto-char (point-min))
      )

    <span class="linecomment">;; Catch segmentation violations</span>
    <span class="linecomment">;; Sometimes get this when editing files from Macs</span>
    <span class="linecomment">;; See the function at the bottom of the file</span>

    (if (buffer-live-p temp-buffer)
	(save-excursion
	  (set-buffer temp-buffer)
	  (goto-char (point-min))
	  (let ((case-fold-search t))
	    (if (looking-at "<span class="quote">Segmentation</span>") <span class="linecomment">;; might work with XEmacs</span>
		(setq seg-error t)))))

    (unless (or (&gt; errors 0) seg-error)
      (let* ((window (get-buffer-window (current-buffer)))
	     (top (window-start window)))

	(unless tidy-markup <span class="linecomment">;; default is "yes" hence inverted logic</span>
	  (delete-region start end)    <span class="linecomment">;; delete the buffer/region</span>
	  (insert-buffer temp-buffer)) <span class="linecomment">;; replace with tidied text</span>

	<span class="linecomment">;; Try not to move the window too much when we tidy the whole buffer</span>
	(set-window-start window top)))

    <span class="linecomment">;; only pop-up window if there's an error</span>

    (if (and (= warnings 0)
	     (= errors 0))
	(delete-windows-on error-buffer t) <span class="linecomment">;; else delete the pop-up window</span>

<span class="linecomment">;;; Thanks to Thomas Baumann for the following fix</span>
<span class="linecomment">;;;       (pop-to-buffer error-buffer t)</span>
<span class="linecomment">;;;       (beginning-of-buffer))</span>
      <span class="linecomment">;; display the error-buffer, but do not select it</span>
      <span class="linecomment">;; one can use C-x ` or mouse-2 to jump to the errors</span>
      (display-buffer error-buffer t))
<span class="linecomment">;;;</span>

    (delete-windows-on temp-buffer t) <span class="linecomment">;; sometimes pops up</span>

    (if seg-error
	(message (concat "<span class="quote">Tidy: Segmentation violation!!!</span>"
			 "<span class="quote">  Check your character encoding.</span>"))
      (message "<span class="quote">%s</span>" tidy-message)
      )
    ))

<span class="linecomment">;;;}}} +</span>

<span class="linecomment">;;;}}}</span>

(provide 'tidy)

<span class="linecomment">;;; tidy.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=tidy.el;missing=de_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="comment local" href="http://www.emacswiki.org/emacs/Comments_on_tidy.el">Talk</a> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=tidy.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=tidy.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=tidy.el">Administration</a></span><!-- test --><span class="time"><br /> Last edited 2011-12-22 17:56 UTC by <a class="author" title="from host81-153-133-145.range81-153.btcentralplus.com" href="http://www.emacswiki.org/emacs/StevePurcell">StevePurcell</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=tidy.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
