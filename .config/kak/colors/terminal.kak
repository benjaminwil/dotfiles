declare-option str black black
declare-option str gray white
declare-option str dark bright-black
declare-option str white bright-white
declare-option str blue blue
declare-option str cyan cyan
declare-option str aqua blue
declare-option str green green
declare-option str amber yellow
declare-option str orange bright-yellow
declare-option str pink magenta
declare-option str purple bright-magenta
declare-option str red red
declare-option str yellow bright-yellow
declare-option str azure bright-blue
declare-option str dimgray bright-black

declare-option str background %opt{black}
declare-option str dimmed_background %opt{gray}
declare-option str foreground %opt{white}

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value "%opt{orange}"
set-face global type "%opt{cyan}"
set-face global variable "%opt{orange}"
set-face global module "%opt{white}"
set-face global function "%opt{blue}"
set-face global string "%opt{green}"
set-face global keyword "%opt{purple}"
set-face global operator "%opt{purple}"
set-face global attribute "%opt{blue}"
set-face global bracket "%opt{white}"
set-face global arguement "%opt{orange}"
set-face global comma "%opt{white}"
set-face global comment "bright-black,black+i"
set-face global docstring "%opt{gray}+i"
set-face global meta "%opt{purple}"
set-face global builtin "%opt{cyan}"
set-face global class "%opt{amber}"
set-face global self "%opt{pink}"
set-face global constant "%opt{white}+b"

# For markup
set-face global title "%opt{pink}"
set-face global header "%opt{orange}"
set-face global bold "%opt{pink}"
set-face global italic "%opt{purple}"
set-face global mono "%opt{green}"
set-face global block "%opt{cyan}"
set-face global link "%opt{green}"
set-face global bullet "%opt{green}"
set-face global list "%opt{white}"

# Builtin faces
set-face global Default "white,black"
set-face global PrimarySelection "black,yellow"
set-face global SecondarySelection "black,bright-blue"
set-face global PrimaryCursor "bright-black,bright-magenta"
set-face global SecondaryCursor "%opt{dark},%opt{blue}"
set-face global PrimaryCursorEol "%opt{dark},%opt{cyan}"
set-face global SecondaryCursorEol "%opt{dark},%opt{amber}"
set-face global LineNumbers "bright-black,black"
set-face global LineNumberCursor "yellow,black+b"
set-face global LineNumbersWrapped "black,black"
set-face global MenuForeground "yellow,black+b"
set-face global MenuBackground "bright-white,black"
set-face global MenuInfo "%opt{orange},%opt{dark}"
set-face global Information Default
set-face global Error "%opt{red},%opt{black}"
set-face global StatusLine "white,black"
set-face global StatusLineMode Statusline
set-face global StatusLineInfo StatusLine
set-face global StatusLineValue StatusLine
set-face global StatusCursor SecondaryCursor
set-face global Prompt "%opt{green},%opt{black}"
set-face global MatchingChar "%opt{black},%opt{blue}"
set-face global Whitespace "%opt{dimgray},%opt{black}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{dimgray},%opt{black}"
