import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

config.set("colors.webpage.darkmode.enabled", True)
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8
    }
})
