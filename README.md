# dotfiles

With git submodules for Vim plugins and Antigen for zsh.

## Install Homebrew

Easy. To install [Homebrew](http://brew.sh), just run this in your terminal: 

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

## Enable text selection in Quick Look

It's really handy to be able to select and copy text by just previewing a document in Quick Look. Just run this command in Terminal to make this real:

```
defaults write com.apple.finder QLEnableTextSelection -bool TRUE && killall Finder
```

## Markdown in Quick Look

To preview Markdown files in Quick Look, install [QLMarkdown](https://github.com/toland/qlmarkdown). I'm not totally sold on that plugin stock, but I haven't had time to whip anything else up.

## Hyper modifier

These instructions are specifically for my MacBook Air setup. Sorry.

I like to use my CAPS key as a hyper modifier (a shortcut for CMD+OPT+CTRL) and SHIFT+CAPS as another modifier. In order to set this up, install [Karabiner](#) and [Seil](#). In Karabiner, you'll need to add this to your `private.xml`:

```
<?xml version="1.0"?>
<root>
	<item>
		<name>F19 to F19</name>
		<appendix>(F19 to Hyper (ctrl+cmd+opt) + F19 Only, send escape)</appendix>
		<identifier>private.f192f19_escape</identifier>
		<autogen>
			--KeyOverlaidModifier--
			KeyCode::F19,
			KeyCode::COMMAND_L,
			ModifierFlag::OPTION_L | ModifierFlag::CONTROL_L,
			KeyCode::ESCAPE
		</autogen>
	</item>
</root>
```

Then, enable the **F19 to Hyper + F19 Only, send escape** option in Karabiner's Change Key tab. In Seil, check the **Change the caps lock key** option and set the keycode to **80**, which (on a 2011 MacBook Air, at least) is the F19 key.

## Disable OS X animations

Here's a complete list of commands to disable those pesky built-in animations that just weigh your system down.

```
# Window and popover open/close
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Smooth scrolling
defaults write -g NSScrollAnimationEnabled -bool false

# Show/hide sheets, resize preference windows, zoom windows
defaults write -g NSWindowResizeTime -float 0.001

# QuickLook open/close
defaults write -g QLPanelAnimationDuration -float 0

# Rubberband scrolling
defaults write -g NSScrollViewRubberbanding -bool false

# Resize windows before and after showing the version browser
defaults write -g NSDocumentRevisionsWindowTransformAnimation -bool false

# Toolbar or menubar in fullscreen
defaults write -g NSToolbarFullScreenAnimationDuration -float 0

# Scrolling columns view
defaults write -g NSBrowserColumnAnimationSpeedMultiplier -float 0

# Show/hide the dock
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock autohide-delay -float 0

# Show/hide Mission Control with CMD+numbers
defaults write com.apple.dock expose-animation-duration -float 0

# Show/hideLaunchpad
defaults write com.apple.dock springboard-show-duration -float 0
defaults write com.apple.dock springboard-hide-duration -float 0

# Changing pages in Launchpad
defaults write com.apple.dock springboard-page-duration -float 0
```

## Switching to zsh

If you have `chsh` installed, this is easy.

```
chsh -s zsh
```

## Git submodules

The way I have my dotfiles set up, just tell git to download the submodules to get all my zsh plugins back.

```
git submodule init && git submodule update
```
