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
Set its font to "Source Code Pro" or "Hasklig". In Guake, set color
scheme to "Treehouse".

Set these keyboard shortcuts:

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

