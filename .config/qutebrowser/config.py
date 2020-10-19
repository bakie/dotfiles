## Documentation:
##   qute://help/configuring.html
##   qute://help/settings.html

## This is here so configs done via the GUI are still loaded.
## Remove it to not load settings done via the GUI.
config.load_autoconfig()

## Tabs
## Position of the tab bar.
## Type: Position
## Valid values:
##   - top
##   - bottom
##   - left
##   - right
c.tabs.position = 'right'

## Width (in pixels or as percentage of the window) of the tab bar if
## it's vertical.
## Type: PercOrInt
c.tabs.width = '5%'

## Bindings for normal mode
## Navigation
config.bind('<Ctrl-h>', 'back')
config.bind('<Ctrl-j>', 'tab-next')
config.bind('<Ctrl-k>', 'tab-prev')
config.bind('<Ctrl-l>', 'forward')
config.bind('H', 'home')
## Userscript binds`
config.bind('<Ctrl-p>', 'spawn --userscript qute-bitwarden')
