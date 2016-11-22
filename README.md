My Dotfiles
===========

This is my dotfiles repository. You can learn more about dotfiles [here](https://dotfiles.github.io/).

Requirements
------------

It is better to install these packages before installing dotfiles.

* Zsh shell
* Tilda (https://github.com/lanoxx/tilda)
* Vim
* Git
* ...


Installation
------------

```sh
chmod +x install.sh
./install.sh
```

After installing, do not move dotfiles repository. If you did that, run `install.sh` once again.


Other Customizations
--------------------


## Gnome Shell

Install Gnome Tweak Tool.

-   Install `xcursor-vanilla-dmz` package and in Gnome Tweak Tool, set Cursor to 'Vanilla-DMZ'.
-   In "Windows" section, Enable "Maximize" and "Minimize" buttons.
-   In "Fonts" section, set monospace font to "Source Code Pro"

Install these gnome extensions:

- [Activities Configurator](https://extensions.gnome.org/extension/358/activities-configurator/)
    - Enable 'Hide Icon', 'Hide Text' and 'Remove Activities Button'
- [Arch Linux Updates Indicator](https://extensions.gnome.org/extension/1010/archlinux-updates-indicator/)
- [Dash to Dock](https://extensions.gnome.org/extension/307/dash-to-dock/)
    - Position: Left | Icon size: 24 | Intelligent Autohide: On | Dodge windows: Off
    - Enable 'Panel mode: extend to the screen edge'
    - Enable 'Show Applications icon' and 'Move the applications button at the beginning...'
    - In Appearance: disable 'Use built-in theme' | Enable 'Shrink the dash', 'Show windows counter...' | Set opacity to 80%
- [Disconnect Wifi](https://extensions.gnome.org/extension/904/disconnect-wifi/)
- [Maximus NG](https://extensions.gnome.org/extension/1026/maximus-ng/)
- [Persian Calendar](https://extensions.gnome.org/extension/240/persian-calendar/)
- [Proxy Switcher](https://extensions.gnome.org/extension/771/proxy-switcher/)
- [Remove Dropdown Arrows](https://extensions.gnome.org/extension/800/remove-dropdown-arrows/)
- [Topicons Plus](https://extensions.gnome.org/extension/1031/topicons/)


## Terminal

Install Tilda or Guake. Configure it to have full width and height.
Set its font to "Source Code Pro" or "Hasklig".

### Tilda config:

    palette = {12850, 4626, 0, 45489, 10023, 3598, 17476, 43433, 0, 43433, 33153, 2827, 22359, 33924, 39321, 38550, 13878, 15420, 45746, 22873, 7453, 30583, 27499, 21331, 16962, 13878, 9509, 60909, 23644, 8224, 21845, 62194, 14135, 61937, 47031, 12593, 34181, 53199, 60652, 57568, 19275, 23130, 61680, 32125, 5140, 65535, 51400, 0}

    key="F12"
    addtab_key="<Primary>t"
    fullscreen_key="F11"
    toggle_transparency_key="F10"
    toggle_searchbar_key="<Primary>f"
    closetab_key="<Primary>w"
    nexttab_key="<Primary>l"
    prevtab_key="<Primary>h"
    movetableft_key="<Primary><Shift>h"
    movetabright_key="<Primary><Shift>l"
    gototab_1_key="<Alt>1"
    gototab_2_key="<Alt>2"
    gototab_3_key="<Alt>3"
    gototab_4_key="<Alt>4"
    gototab_5_key="<Alt>5"
    gototab_6_key="<Alt>6"
    gototab_7_key="<Alt>7"
    gototab_8_key="<Alt>8"
    gototab_9_key="<Alt>9"
    gototab_10_key="<Alt>0"
    copy_key="<Shift><Control>c"
    paste_key="<Shift><Control>v"
    quit_key="<Primary><Shift>q"
    increase_font_size_key="<Control>equal"
    decrease_font_size_key="<Control>minus"
    normalize_font_size_key="<Control>0"


    font="Source Code Pro 13"
    lines=10000
    max_width=1366
    max_height=741
    tab_pos=1
    on_last_terminal_exit=1
    hidden=true

### Guake config

Set color scheme to 'Treehouse'. Set these keyboard shortcuts:

| Action                | Shortcut           |
| --------------------- | ------------------ |
| Show/Hide terminal    | `F12`              |
| New tab               | `Ctrl + T`         |
| Close tab             | `Ctrl + W`         |
| Next tab              | `Ctrl + L`         |
| Prev tab              | `Ctrl + H`         |
| Move tab right        | `Ctrl + Shift + L` |
| Move tab left         | `Ctrl + Shift + H` |
| Goto tab 1            | `Alt + 1`          |
| Goto tab 2            | `Alt + 2`          |
| Goto tab ...          | `Alt + ...`        |


## Chromium

Install these extensions:

- Vimium
- Wappalyzer
- Alexa Traffic Rank
- Styler
- DevTools Author
    - Enable chrome://flags/#enable-devtools-experiments
    - Open DevTools; Settings > Experiments > Allow custom UI themes
    - Set Devtools > Settings > Preferences > Appearance > Theme to "Dark"
    - Set DevTools Author's theme to "Default", set font to "Source Code Pro", and font size to 12
- React Developer Tools
- Redux Devtools


## Note Taking

Install mikidown.
