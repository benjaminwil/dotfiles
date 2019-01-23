## qutebrowser config.py
##
## Documentation:
##   qute://help/configuring.html
##   qute://help/settings.html

one_dark = {
  '00': '#1e2127', '08': '#5c6370',
  '01': '#e06c75', '09': '#e06c75',
  '02': '#98c379', '10': '#98c379',
  '03': '#d19a66', '11': '#d19a66',
  '04': '#61afef', '12': '#61afef',
  '05': '#c678dd', '13': '#c678dd',
  '06': '#56b6c2', '14': '#56b6c2',
  '07': '#abb2bf', '15': '#ffffff'
}

## Aliases for commands. The keys of the given dictionary are the
## aliases, while the values are the commands they map to.
## Type: Dict
c.aliases = {'w': 'session-save', 'q': 'close', 'wq': 'quit --save'}

## This setting can be used to map keys to other keys. When the key used
## as dictionary-key is pressed, the binding for the key used as
## dictionary-value is invoked instead. This is useful for global
## remappings of keys, for example to map Ctrl-[ to Escape. Note that
## when a key is bound (via `bindings.default` or `bindings.commands`),
## the mapping is ignored.
## Type: Dict
# c.bindings.key_mappings = {'<Ctrl-[>': '<Escape>', '<Ctrl-6>': '<Ctrl-^>', '<Ctrl-M>': '<Return>', '<Ctrl-J>': '<Return>', '<Shift-Return>': '<Return>', '<Enter>': '<Return>', '<Shift-Enter>': '<Return>', '<Ctrl-Enter>': '<Ctrl-Return>'}

c.colors.completion.category.bg = one_dark['00']
c.colors.completion.category.border.bottom = one_dark['00']
c.colors.completion.category.border.top = one_dark['00']
c.colors.completion.category.fg = one_dark['15']
c.colors.completion.even.bg = one_dark['00']
c.colors.completion.fg = one_dark['07']
c.colors.completion.item.selected.bg = one_dark['00']
c.colors.completion.item.selected.border.bottom = one_dark['00']
c.colors.completion.item.selected.border.top = one_dark['00']
c.colors.completion.item.selected.fg = one_dark['03']
c.colors.completion.match.fg = one_dark['04']
c.colors.completion.odd.bg = one_dark['00']
c.colors.completion.scrollbar.bg = one_dark['00']
c.colors.completion.scrollbar.fg = one_dark['07']

c.colors.downloads.bar.bg = one_dark['00']
c.colors.downloads.error.bg = one_dark['00']
c.colors.downloads.error.fg = one_dark['01']
c.colors.downloads.start.bg = one_dark['00']
c.colors.downloads.start.fg = one_dark['02']
c.colors.downloads.stop.bg = one_dark['00']
c.colors.downloads.stop.fg = one_dark['03']

## Color gradient interpolation system for download backgrounds.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.bg = 'rgb'

## Color gradient interpolation system for download text.
## Type: ColorSystem
## Valid values:
##   - rgb: Interpolate in the RGB color system.
##   - hsv: Interpolate in the HSV color system.
##   - hsl: Interpolate in the HSL color system.
##   - none: Don't show a gradient.
# c.colors.downloads.system.fg = 'rgb'

c.colors.hints.bg = one_dark['06']
c.colors.hints.fg = one_dark['03']
c.colors.hints.match.fg = one_dark['01']
# c.colors.keyhint.bg = 'rgba(0, 0, 0, 80%)'
c.colors.keyhint.fg = one_dark['03']
c.colors.keyhint.suffix.fg = one_dark['02']

c.colors.messages.error.bg = one_dark['00']
c.colors.messages.error.border = one_dark['00']
c.colors.messages.error.fg = one_dark['01']
c.colors.messages.info.bg = one_dark['00']
c.colors.messages.info.border = one_dark['00']
c.colors.messages.info.fg = one_dark['05']
c.colors.messages.warning.bg = one_dark['00']
c.colors.messages.warning.border = one_dark['00']
c.colors.messages.warning.fg = one_dark['06']

c.colors.prompts.bg = one_dark['00']
c.colors.prompts.border = '1px solid ' + one_dark['08']
c.colors.prompts.fg = one_dark['07']
c.colors.prompts.selected.bg = one_dark['03']

c.colors.statusbar.caret.bg = one_dark['00']
c.colors.statusbar.caret.fg = one_dark['03']
c.colors.statusbar.caret.selection.bg = one_dark['00']
c.colors.statusbar.caret.selection.fg = one_dark['06']
c.colors.statusbar.command.bg = one_dark['00']
c.colors.statusbar.command.fg = one_dark['07']
c.colors.statusbar.command.private.bg = one_dark['05']
c.colors.statusbar.command.private.fg = one_dark['07']
c.colors.statusbar.insert.bg = one_dark['00']
c.colors.statusbar.insert.fg = one_dark['04']
c.colors.statusbar.normal.bg = one_dark['00']
c.colors.statusbar.normal.fg = one_dark['07']
c.colors.statusbar.passthrough.bg = one_dark['00']
c.colors.statusbar.passthrough.fg = one_dark['07']
c.colors.statusbar.private.bg = one_dark['05']
c.colors.statusbar.private.fg = one_dark['07']
c.colors.statusbar.progress.bg = one_dark['00']
c.colors.statusbar.url.error.fg = one_dark['03']
c.colors.statusbar.url.fg = one_dark['15']
c.colors.statusbar.url.hover.fg = one_dark['03']
c.colors.statusbar.url.success.http.fg = one_dark['03']
c.colors.statusbar.url.success.https.fg = one_dark['03']
c.colors.statusbar.url.warn.fg = one_dark['01']

c.colors.tabs.bar.bg = one_dark['00']
c.colors.tabs.even.bg = one_dark['00']
c.colors.tabs.even.fg = one_dark['07']
c.colors.tabs.indicator.error = one_dark['00']
c.colors.tabs.indicator.start = one_dark['00']
c.colors.tabs.indicator.stop = one_dark['00']
# c.colors.tabs.indicator.system = 'rgb'
c.colors.tabs.odd.bg = one_dark['00']
c.colors.tabs.odd.fg = one_dark['07']
c.colors.tabs.selected.even.bg = one_dark['00']
c.colors.tabs.selected.even.fg = one_dark['03']
c.colors.tabs.selected.odd.bg = one_dark['00']
c.colors.tabs.selected.odd.fg = one_dark['03']

c.colors.webpage.bg = 'white'

## How many commands to save in the command history. 0: no history / -1:
## unlimited
## Type: Int
c.completion.cmd_history_max_items = 999
c.completion.height = '30%'
c.completion.min_chars = 2
# c.completion.quick = True
c.completion.scrollbar.padding = 2
c.completion.scrollbar.width = 8
c.completion.show = 'auto'
c.completion.shrink = True
c.completion.use_best_match = True
c.completion.web_history.max_items = -1

c.content.cookies.accept = 'no-3rdparty'
c.content.cookies.store = True

c.content.default_encoding = 'utf-8'
# c.content.dns_prefetch = True
# c.content.frame_flattening = False
c.content.geolocation = 'ask'

c.content.headers.accept_language = 'en-US,en'
c.content.headers.custom = {}
c.content.headers.do_not_track = True
c.content.headers.referer = 'same-domain'
c.content.headers.user_agent = None

c.content.host_blocking.enabled = True
c.content.host_blocking.whitelist = ['piwik.org']
c.content.host_blocking.lists = [
  'https://www.malwaredomainlist.com/hostslist/hosts.txt',
  'http://someonewhocares.org/hosts/hosts',
  'http://winhelp2002.mvps.org/hosts.zip',
  'http://malwaredomains.lehigh.edu/files/justdomains.zip',
  'https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext'
]

c.content.hyperlink_auditing = False

c.content.images = True

c.content.javascript.alert = True
c.content.javascript.can_access_clipboard = False
# c.content.javascript.can_close_tabs = False
c.content.javascript.can_open_tabs_automatically = False
c.content.javascript.enabled = True

c.content.javascript.log = {
  'unknown': 'debug',
  'info': 'debug',
  'warning': 'debug',
  'error': 'debug'
}

c.content.javascript.modal_dialog = False
c.content.javascript.prompt = True

c.content.local_content_can_access_file_urls = True
c.content.local_content_can_access_remote_urls = False
c.content.local_storage = True

c.content.media_capture = 'ask'
c.content.netrc_file = None
# c.content.notifications = 'ask'
c.content.pdfjs = False
c.content.plugins = True
c.content.print_element_backgrounds = True
c.content.private_browsing = False

c.content.proxy = 'system'
# c.content.proxy_dns_requests = True

c.content.ssl_strict = 'ask'
c.content.user_stylesheets = []
c.content.webgl = True
# c.content.xss_auditing = False

# c.downloads.location.directory = None
c.downloads.location.prompt = False
c.downloads.location.remember = True
c.downloads.location.suggestion = 'path'

c.downloads.open_dispatcher = None
c.downloads.position = 'bottom'
c.downloads.remove_finished = 4000

## The editor (and arguments) to use for the `open-editor` command. `{}`
## gets replaced by the filename of the file to be edited.
## Type: ShellCommand
c.editor.encoding = 'utf-8'

c.fonts.completion.category = 'bold 12pt sans-serif'
c.fonts.completion.entry = '12pt sans-serif'

c.fonts.debug_console = '12pt monospace'
c.fonts.downloads = '12pt sans-serif'
c.fonts.hints = 'bold 12pt sans-serif'
c.fonts.keyhint = '12pt sans-serif'

c.fonts.messages.error = '12pt monospace'
c.fonts.messages.info = '12pt monospace'
c.fonts.messages.warning = '12pt monospace'

c.fonts.monospace = 'SF Mono'
c.fonts.prompts = '12pt sans-serif'
c.fonts.statusbar = '12pt sans-serif'
c.fonts.tabs = '12pt sans-serif'

c.fonts.web.family.cursive = ''
c.fonts.web.family.fantasy = ''
c.fonts.web.family.fixed = 'SF Mono'
c.fonts.web.family.sans_serif = 'IBM Plex Sans'
c.fonts.web.family.serif = 'Times New Roman'
c.fonts.web.family.standard = 'SF Pro Text'

c.fonts.web.size.default = 13
c.fonts.web.size.default_fixed = 11
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6

## Controls when a hint can be automatically followed without pressing
## Enter.
## Type: String
## Valid values:
##   - always: Auto-follow whenever there is only a single hint on a page.
##   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
##   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
##   - never: The user will always need to press Enter to follow a hint.
# c.hints.auto_follow = 'unique-match'

## A timeout (in milliseconds) to ignore normal-mode key bindings after a
## successful auto-follow.
## Type: Int
# c.hints.auto_follow_timeout = 0

## CSS border value for hints.
## Type: String
c.hints.border = '1px solid ' + one_dark['03']

## Chars used for hint strings.
## Type: UniqueCharString
# c.hints.chars = 'asdfghjkl'

## The dictionary file to be used by the word hints.
## Type: File
# c.hints.dictionary = '/usr/share/dict/words'

## Which implementation to use to find elements to hint.
## Type: String
## Valid values:
##   - javascript: Better but slower
##   - python: Slightly worse but faster
# c.hints.find_implementation = 'python'

## Hide unmatched hints in rapid mode.
## Type: Bool
# c.hints.hide_unmatched_rapid_hints = True

## Minimum number of chars used for hint strings.
## Type: Int
# c.hints.min_chars = 1

## Mode to use for hints.
## Type: String
## Valid values:
##   - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
##   - letter: Use the chars in the `hints.chars` setting.
##   - word: Use hints words based on the html elements and the extra words.
# c.hints.mode = 'letter'

## A comma-separated list of regexes to use for 'next' links.
## Type: List of Regex
# c.hints.next_regexes = ['\\bnext\\b', '\\bmore\\b', '\\bnewer\\b', '\\b[>â†’â‰«]\\b', '\\b(>>|Â»)\\b', '\\bcontinue\\b']

## A comma-separated list of regexes to use for 'prev' links.
## Type: List of Regex
# c.hints.prev_regexes = ['\\bprev(ious)?\\b', '\\bback\\b', '\\bolder\\b', '\\b[<â†â‰ª]\\b', '\\b(<<|Â«)\\b']

## Scatter hint key chains (like Vimium) or not (like dwb). Ignored for
## number hints.
## Type: Bool
# c.hints.scatter = True

## Make chars in hint strings uppercase.
## Type: Bool
# c.hints.uppercase = False

## The maximum time in minutes between two history items for them to be
## considered being from the same browsing session. Items with less time
## between them are grouped when being displayed in `:history`. Use -1 to
## disable separation.
## Type: Int
# c.history_gap_interval = 30

## Find text on a page case-insensitively.
## Type: String
## Valid values:
##   - always: Search case-insensitively
##   - never: Search case-sensitively
##   - smart: Search case-sensitively if there are capital chars
# c.ignore_case = 'smart'

## Forward unbound keys to the webview in normal mode.
## Type: String
## Valid values:
##   - all: Forward all unbound keys.
##   - auto: Forward unbound non-alphanumeric keys.
##   - none: Don't forward any keys.
# c.input.forward_unbound_keys = 'auto'

## Leave insert mode if a non-editable element is clicked.
## Type: Bool
# c.input.insert_mode.auto_leave = True

## Automatically enter insert mode if an editable element is focused
## after loading the page.
## Type: Bool
# c.input.insert_mode.auto_load = False

## Switch to insert mode when clicking flash and other plugins.
## Type: Bool
# c.input.insert_mode.plugins = False

## Include hyperlinks in the keyboard focus chain when tabbing.
## Type: Bool
# c.input.links_included_in_focus_chain = True

## Timeout (in milliseconds) for partially typed key bindings. If the
## current input forms only partial matches, the keystring will be
## cleared after this time.
## Type: Int
# c.input.partial_timeout = 5000

## Enable Opera-like mouse rocker gestures. This disables the context
## menu.
## Type: Bool
# c.input.rocker_gestures = False

## Enable Spatial Navigation. Spatial navigation consists in the ability
## to navigate between focusable elements in a Web page, such as
## hyperlinks and form controls, by using Left, Right, Up and Down arrow
## keys. For example, if a user presses the Right key, heuristics
## determine whether there is an element he might be trying to reach
## towards the right and which element he probably wants.
## Type: Bool
# c.input.spatial_navigation = False

## Keychains that shouldn't be shown in the keyhint dialog. Globs are
## supported, so `;*` will blacklist all keychains starting with `;`. Use
## `*` to disable keyhints.
## Type: List of String
# c.keyhint.blacklist = []

## Time from pressing a key to seeing the keyhint dialog (ms).
## Type: Int
# c.keyhint.delay = 500

## The rounding radius for the edges of the keyhint dialog.
## Type: Int
# c.keyhint.radius = 6

## Time (in ms) to show messages in the statusbar for. Set to 0 to never
## clear messages.
## Type: Int
# c.messages.timeout = 2000

## How to open links in an existing instance if a new one is launched.
## This happens when e.g. opening a link from a terminal. See
## `new_instance_open_target_window` to customize in which window the
## link is opened in.
## Type: String
## Valid values:
##   - tab: Open a new tab in the existing window and activate the window.
##   - tab-bg: Open a new background tab in the existing window and activate the window.
##   - tab-silent: Open a new tab in the existing window without activating the window.
##   - tab-bg-silent: Open a new background tab in the existing window without activating the window.
##   - window: Open in a new window.
# c.new_instance_open_target = 'tab'

## Which window to choose when opening links as new tabs. When
## `new_instance_open_target` is not set to `window`, this is ignored.
## Type: String
## Valid values:
##   - first-opened: Open new tabs in the first (oldest) opened window.
##   - last-opened: Open new tabs in the last (newest) opened window.
##   - last-focused: Open new tabs in the most recently focused window.
##   - last-visible: Open new tabs in the most recently visible window.
# c.new_instance_open_target_window = 'last-focused'

## Show a filebrowser in upload/download prompts.
## Type: Bool
# c.prompt.filebrowser = True

## The rounding radius for the edges of prompts.
## Type: Int
# c.prompt.radius = 8

## Additional arguments to pass to Qt, without leading `--`. With
## QtWebEngine, some Chromium arguments (see
## https://peter.sh/experiments/chromium-command-line-switches/ for a
## list) will work. This setting requires a restart.
## Type: List of String
# c.qt.args = []

## Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
## environment variable and is useful to force using the XCB plugin when
## running QtWebEngine on Wayland.
## Type: String
# c.qt.force_platform = None

## Force software rendering for QtWebEngine. This is needed for
## QtWebEngine to work with Nouveau drivers. This setting requires a
## restart.
## Type: Bool
# c.qt.force_software_rendering = False

## Show a scrollbar.
## Type: Bool
# c.scrolling.bar = False

## Enable smooth scrolling for web pages. Note smooth scrolling does not
## work with the `:scroll-px` command.
## Type: Bool
# c.scrolling.smooth = False

## The name of the session to save by default. If this is set to null,
## the session which was last loaded is saved.
## Type: SessionName
# c.session_default_name = None

## Spell checking languages. You can check for available languages and
## install dictionaries using scripts/install_dict.py. Run the script
## with -h/--help for instructions.
## Type: List of String
## Valid values:
##   - af-ZA: Afrikaans (South Africa)
##   - bg-BG: Bulgarian (Bulgaria)
##   - ca-ES: Catalan (Spain)
##   - cs-CZ: Czech (Czech Republic)
##   - da-DK: Danish (Denmark)
##   - de-DE: German (Germany)
##   - el-GR: Greek (Greece)
##   - en-CA: English (Canada)
##   - en-GB: English (United Kingdom)
##   - en-US: English (United States)
##   - es-ES: Spanish (Spain)
##   - et-EE: Estonian (Estonia)
##   - fa-IR: Farsi (Iran)
##   - fo-FO: Faroese (Faroe Islands)
##   - fr-FR: French (France)
##   - he-IL: Hebrew (Israel)
##   - hi-IN: Hindi (India)
##   - hr-HR: Croatian (Croatia)
##   - hu-HU: Hungarian (Hungary)
##   - id-ID: Indonesian (Indonesia)
##   - it-IT: Italian (Italy)
##   - ko: Korean
##   - lt-LT: Lithuanian (Lithuania)
##   - lv-LV: Latvian (Latvia)
##   - nb-NO: Norwegian (Norway)
##   - nl-NL: Dutch (Netherlands)
##   - pl-PL: Polish (Poland)
##   - pt-BR: Portuguese (Brazil)
##   - pt-PT: Portuguese (Portugal)
##   - ro-RO: Romanian (Romania)
##   - ru-RU: Russian (Russia)
##   - sh: Serbo-Croatian
##   - sk-SK: Slovak (Slovakia)
##   - sl-SI: Slovenian (Slovenia)
##   - sq: Albanian
##   - sr: Serbian
##   - sv-SE: Swedish (Sweden)
##   - ta-IN: Tamil (India)
##   - tg-TG: Tajik (Tajikistan)
##   - tr-TR: Turkish (Turkey)
##   - uk-UA: Ukrainian (Ukraine)
##   - vi-VN: Vietnamese (Viet Nam)
# c.spellcheck.languages = []

c.statusbar.hide = True
c.statusbar.padding = {
  'top': 4,
  'bottom': 4,
  'left': 4,
  'right': 4
}
c.statusbar.position = 'bottom'

c.tabs.background = True
c.tabs.close_mouse_button = 'right'
c.tabs.close_mouse_button_on_bar = 'new-tab'
c.tabs.favicons.scale = 1.0
c.tabs.favicons.show = 'always'
c.tabs.indicator.padding = {
  'top': 12,
  'bottom': 12,
  'left': 0,
  'right': 0
}
c.tabs.last_close = 'ignore'
c.tabs.mousewheel_switching = True
c.tabs.new_position.related = 'next'
c.tabs.new_position.unrelated = 'last'
c.tabs.padding = {
  'top': 4,
  'bottom': 4,
  'left': 6,
  'right': 2
}
c.tabs.position = 'top'
c.tabs.select_on_remove = 'next'
c.tabs.show = 'multiple'
c.tabs.show_switching_delay = 800
c.tabs.tabs_are_windows = False
c.tabs.title.alignment = 'left'
c.tabs.title.format = ' {title}'
c.tabs.title.format_pinned = '{index}'
# c.tabs.width.bar = '20%' # only if the tab bar is set to vertical display
# c.tabs.width.indicator = 0
c.tabs.wrap = True

c.url.auto_search = 'naive'
c.url.default_page = 'about:blank'
c.url.incdec_segments = ['path', 'query']
c.url.searchengines = {
  'DEFAULT': 'https://duckduckgo.com/?q={}',
  'g': 'https://encrypted.google.com/search?q={}'
}
c.url.start_pages = ['https://start.duckduckgo.com']
c.url.yank_ignored_parameters = ['ref', 'utm_source', 'utm_medium', 'utm_campaign', 'utm_term', 'utm_content']

c.window.hide_decoration = False
c.window.title_format = '{perc}{title}{title_sep}qutebrowser'

c.zoom.default = '100%'
c.zoom.levels = ['25%', '33%', '50%', '67%', '75%', '90%', '100%', '110%', '125%', '150%']
c.zoom.mouse_divider = 512
# c.zoom.text_only = False

## Bindings for normal mode
# config.bind("'", 'enter-mode jump_mark')
# config.bind('+', 'zoom-in')
# config.bind('-', 'zoom-out')
# config.bind('.', 'repeat-command')
# config.bind('/', 'set-cmd-text /')
# config.bind(':', 'set-cmd-text :')
# config.bind(';I', 'hint images tab')
# config.bind(';O', 'hint links fill :open -t -r {hint-url}')
# config.bind(';R', 'hint --rapid links window')
# config.bind(';Y', 'hint links yank-primary')
# config.bind(';b', 'hint all tab-bg')
# config.bind(';d', 'hint links download')
# config.bind(';f', 'hint all tab-fg')
# config.bind(';h', 'hint all hover')
# config.bind(';i', 'hint images')
# config.bind(';o', 'hint links fill :open {hint-url}')
# config.bind(';r', 'hint --rapid links tab-bg')
# config.bind(';t', 'hint inputs')
# config.bind(';y', 'hint links yank')
# config.bind('<Alt-1>', 'tab-focus 1')
# config.bind('<Alt-2>', 'tab-focus 2')
# config.bind('<Alt-3>', 'tab-focus 3')
# config.bind('<Alt-4>', 'tab-focus 4')
# config.bind('<Alt-5>', 'tab-focus 5')
# config.bind('<Alt-6>', 'tab-focus 6')
# config.bind('<Alt-7>', 'tab-focus 7')
# config.bind('<Alt-8>', 'tab-focus 8')
# config.bind('<Alt-9>', 'tab-focus -1')
# config.bind('<Ctrl-A>', 'navigate increment')
# config.bind('<Ctrl-Alt-p>', 'print')
# config.bind('<Ctrl-B>', 'scroll-page 0 -1')
# config.bind('<Ctrl-D>', 'scroll-page 0 0.5')
# config.bind('<Ctrl-F5>', 'reload -f')
# config.bind('<Ctrl-F>', 'scroll-page 0 1')
# config.bind('<Ctrl-N>', 'open -w')
# config.bind('<Ctrl-PgDown>', 'tab-next')
# config.bind('<Ctrl-PgUp>', 'tab-prev')
# config.bind('<Ctrl-Q>', 'quit')
# config.bind('<Ctrl-Return>', 'follow-selected -t')
# config.bind('<Ctrl-Shift-N>', 'open -p')
# config.bind('<Ctrl-Shift-T>', 'undo')
# config.bind('<Ctrl-Shift-W>', 'close')
# config.bind('<Ctrl-T>', 'open -t')
# config.bind('<Ctrl-Tab>', 'tab-focus last')
# config.bind('<Ctrl-U>', 'scroll-page 0 -0.5')
# config.bind('<Ctrl-V>', 'enter-mode passthrough')
# config.bind('<Ctrl-W>', 'tab-close')
# config.bind('<Ctrl-X>', 'navigate decrement')
# config.bind('<Ctrl-^>', 'tab-focus last')
# config.bind('<Ctrl-h>', 'home')
# config.bind('<Ctrl-p>', 'tab-pin')
# config.bind('<Ctrl-s>', 'stop')
# config.bind('<Escape>', 'clear-keychain ;; search ;; fullscreen --leave')
# config.bind('<F11>', 'fullscreen')
# config.bind('<F5>', 'reload')
# config.bind('<Return>', 'follow-selected')
# config.bind('<back>', 'back')
# config.bind('<forward>', 'forward')
# config.bind('=', 'zoom')
# config.bind('?', 'set-cmd-text ?')
# config.bind('@', 'run-macro')
# config.bind('B', 'set-cmd-text -s :quickmark-load -t')
# config.bind('D', 'tab-close -o')
# config.bind('F', 'hint all tab')
# config.bind('G', 'scroll-to-perc')
# config.bind('H', 'back')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
# config.bind('L', 'forward')
# config.bind('M', 'bookmark-add')
# config.bind('N', 'search-prev')
config.bind('O', 'set-cmd-text :open {url:pretty}')
# config.bind('PP', 'open -t -- {primary}')
# config.bind('Pp', 'open -t -- {clipboard}')
# config.bind('R', 'reload -f')
# config.bind('Sb', 'open qute://bookmarks#bookmarks')
# config.bind('Sh', 'open qute://history')
# config.bind('Sq', 'open qute://bookmarks')
# config.bind('Ss', 'open qute://settings')
# config.bind('T', 'tab-focus')
config.bind('W', 'set-cmd-text -s :open -p')
config.bind('X', 'close')
# config.bind('ZQ', 'quit')
# config.bind('ZZ', 'quit --save')
# config.bind('[[', 'navigate prev')
# config.bind(']]', 'navigate next')
# config.bind('`', 'enter-mode set_mark')
# config.bind('ad', 'download-cancel')
# config.bind('b', 'set-cmd-text -s :quickmark-load')
# config.bind('cd', 'download-clear')
# config.bind('co', 'tab-only')
# config.bind('d', 'tab-close')
# config.bind('f', 'hint')
# config.bind('g$', 'tab-focus -1')
# config.bind('g0', 'tab-focus 1')
# config.bind('gB', 'set-cmd-text -s :bookmark-load -t')
# config.bind('gC', 'tab-clone')
# config.bind('gO', 'set-cmd-text :open -t -r {url:pretty}')
# config.bind('gU', 'navigate up -t')
# config.bind('g^', 'tab-focus 1')
# config.bind('ga', 'open -t')
# config.bind('gb', 'set-cmd-text -s :bookmark-load')
# config.bind('gd', 'download')
# config.bind('gf', 'view-source')
# config.bind('gg', 'scroll-to-perc 0')
# config.bind('gl', 'tab-move -')
# config.bind('gm', 'tab-move')
# config.bind('go', 'set-cmd-text :open {url:pretty}')
# config.bind('gr', 'tab-move +')
# config.bind('gt', 'set-cmd-text -s :buffer')
# config.bind('gu', 'navigate up')
# config.bind('h', 'scroll left')
# config.bind('i', 'enter-mode insert')
# config.bind('j', 'scroll down')
# config.bind('k', 'scroll up')
# config.bind('l', 'scroll right')
# config.bind('m', 'quickmark-save')
# config.bind('n', 'search-next')
# config.bind('o', 'set-cmd-text -s :open')
# config.bind('pP', 'open -- {primary}')
# config.bind('pp', 'open -- {clipboard}')
# config.bind('q', 'record-macro')
# config.bind('r', 'reload')
# config.bind('sf', 'save')
# config.bind('sk', 'set-cmd-text -s :bind')
# config.bind('sl', 'set-cmd-text -s :set -t')
# config.bind('ss', 'set-cmd-text -s :set')
config.bind('t', 'set-cmd-text -s :open -t')
# config.bind('th', 'back -t')
# config.bind('tl', 'forward -t')
# config.bind('u', 'undo')
# config.bind('v', 'enter-mode caret')
# config.bind('wB', 'set-cmd-text -s :bookmark-load -w')
# config.bind('wO', 'set-cmd-text :open -w {url:pretty}')
# config.bind('wP', 'open -w -- {primary}')
# config.bind('wb', 'set-cmd-text -s :quickmark-load -w')
# config.bind('wf', 'hint all window')
# config.bind('wh', 'back -w')
# config.bind('wi', 'inspector')
# config.bind('wl', 'forward -w')
# config.bind('wo', 'set-cmd-text -s :open -w')
# config.bind('wp', 'open -w -- {clipboard}')
# config.bind('xO', 'set-cmd-text :open -b -r {url:pretty}')
# config.bind('xb', 'config-cycle statusbar.hide')
# config.bind('xo', 'set-cmd-text -s :open -b')
# config.bind('xt', 'config-cycle tabs.show always switching')
# config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
# config.bind('yD', 'yank domain -s')
# config.bind('yP', 'yank pretty-url -s')
# config.bind('yT', 'yank title -s')
# config.bind('yY', 'yank -s')
# config.bind('yd', 'yank domain')
# config.bind('yp', 'yank pretty-url')
# config.bind('yt', 'yank title')
# config.bind('yy', 'yank')
# config.bind('{{', 'navigate prev -t')
# config.bind('}}', 'navigate next -t')

## Bindings for caret mode
# config.bind('$', 'move-to-end-of-line', mode='caret')
# config.bind('0', 'move-to-start-of-line', mode='caret')
# config.bind('<Ctrl-Space>', 'drop-selection', mode='caret')
# config.bind('<Escape>', 'leave-mode', mode='caret')
# config.bind('<Return>', 'yank selection', mode='caret')
# config.bind('<Space>', 'toggle-selection', mode='caret')
# config.bind('G', 'move-to-end-of-document', mode='caret')
# config.bind('H', 'scroll left', mode='caret')
# config.bind('J', 'scroll down', mode='caret')
# config.bind('K', 'scroll up', mode='caret')
# config.bind('L', 'scroll right', mode='caret')
# config.bind('Y', 'yank selection -s', mode='caret')
# config.bind('[', 'move-to-start-of-prev-block', mode='caret')
# config.bind(']', 'move-to-start-of-next-block', mode='caret')
# config.bind('b', 'move-to-prev-word', mode='caret')
# config.bind('c', 'enter-mode normal', mode='caret')
# config.bind('e', 'move-to-end-of-word', mode='caret')
# config.bind('gg', 'move-to-start-of-document', mode='caret')
# config.bind('h', 'move-to-prev-char', mode='caret')
# config.bind('j', 'move-to-next-line', mode='caret')
# config.bind('k', 'move-to-prev-line', mode='caret')
# config.bind('l', 'move-to-next-char', mode='caret')
# config.bind('v', 'toggle-selection', mode='caret')
# config.bind('w', 'move-to-next-word', mode='caret')
# config.bind('y', 'yank selection', mode='caret')
# config.bind('{', 'move-to-end-of-prev-block', mode='caret')
# config.bind('}', 'move-to-end-of-next-block', mode='caret')

## Bindings for command mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='command')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='command')
# config.bind('<Alt-D>', 'rl-kill-word', mode='command')
# config.bind('<Alt-F>', 'rl-forward-word', mode='command')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='command')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='command')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='command')
# config.bind('<Ctrl-D>', 'completion-item-del', mode='command')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='command')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='command')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='command')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='command')
# config.bind('<Ctrl-N>', 'command-history-next', mode='command')
# config.bind('<Ctrl-P>', 'command-history-prev', mode='command')
# config.bind('<Ctrl-Shift-Tab>', 'completion-item-focus prev-category', mode='command')
# config.bind('<Ctrl-Tab>', 'completion-item-focus next-category', mode='command')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='command')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='command')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='command')
# config.bind('<Down>', 'command-history-next', mode='command')
# config.bind('<Escape>', 'leave-mode', mode='command')
# config.bind('<Return>', 'command-accept', mode='command')
config.bind('<Ctrl-Return>', 'set-cmd-text --append .com ;; command-accept', mode='command')
# config.bind('<Shift-Delete>', 'completion-item-del', mode='command')
# config.bind('<Shift-Tab>', 'completion-item-focus prev', mode='command')
# config.bind('<Tab>', 'completion-item-focus next', mode='command')
# config.bind('<Up>', 'command-history-prev', mode='command')

## Bindings for hint mode
# config.bind('<Ctrl-B>', 'hint all tab-bg', mode='hint')
# config.bind('<Ctrl-F>', 'hint links', mode='hint')
# config.bind('<Ctrl-R>', 'hint --rapid links tab-bg', mode='hint')
# config.bind('<Escape>', 'leave-mode', mode='hint')
# config.bind('<Return>', 'follow-hint', mode='hint')

## Bindings for insert mode
# config.bind('<Ctrl-E>', 'open-editor', mode='insert')
# config.bind('<Escape>', 'leave-mode', mode='insert')
# config.bind('<Shift-Ins>', 'insert-text {primary}', mode='insert')

## Bindings for passthrough mode
# config.bind('<Ctrl-V>', 'leave-mode', mode='passthrough')

## Bindings for prompt mode
# config.bind('<Alt-B>', 'rl-backward-word', mode='prompt')
# config.bind('<Alt-Backspace>', 'rl-backward-kill-word', mode='prompt')
# config.bind('<Alt-D>', 'rl-kill-word', mode='prompt')
# config.bind('<Alt-F>', 'rl-forward-word', mode='prompt')
# config.bind('<Ctrl-?>', 'rl-delete-char', mode='prompt')
# config.bind('<Ctrl-A>', 'rl-beginning-of-line', mode='prompt')
# config.bind('<Ctrl-B>', 'rl-backward-char', mode='prompt')
# config.bind('<Ctrl-E>', 'rl-end-of-line', mode='prompt')
# config.bind('<Ctrl-F>', 'rl-forward-char', mode='prompt')
# config.bind('<Ctrl-H>', 'rl-backward-delete-char', mode='prompt')
# config.bind('<Ctrl-K>', 'rl-kill-line', mode='prompt')
# config.bind('<Ctrl-U>', 'rl-unix-line-discard', mode='prompt')
# config.bind('<Ctrl-W>', 'rl-unix-word-rubout', mode='prompt')
# config.bind('<Ctrl-X>', 'prompt-open-download', mode='prompt')
# config.bind('<Ctrl-Y>', 'rl-yank', mode='prompt')
# config.bind('<Down>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Escape>', 'leave-mode', mode='prompt')
# config.bind('<Return>', 'prompt-accept', mode='prompt')
# config.bind('<Shift-Tab>', 'prompt-item-focus prev', mode='prompt')
# config.bind('<Tab>', 'prompt-item-focus next', mode='prompt')
# config.bind('<Up>', 'prompt-item-focus prev', mode='prompt')
# config.bind('n', 'prompt-accept no', mode='prompt')
# config.bind('y', 'prompt-accept yes', mode='prompt')

## Bindings for register mode
# config.bind('<Escape>', 'leave-mode', mode='register')
