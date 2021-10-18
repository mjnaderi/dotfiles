My Dotfiles
===========

This is my dotfiles repository. You can learn more about dotfiles [here](https://dotfiles.github.io/).

Requirements
------------

Install Ansible.

```shell
pacman -S ansible
ansible-galaxy collection install community.general
```


Installation
------------

Copy `.env.sample` to `.env` and configure environment variables. Then run the playbook:

```shell
./install.sh
```

After installing, do not move dotfiles repository. If you did that, install once again.


Manual Configurations
---------------------

Here I explain some manual configurations that are hard to automate,
or I was too lazy to automate!


## Wayland

### Screen Capture on Wayland

To fix the black screen problem when sharing/recording screen in wayland,
read [this](https://wiki.archlinux.org/title/PipeWire#WebRTC_screen_sharing).

### Enable Native Wayland Support for Chromium/Chrome

Add these lines to `~/.config/chromium-flags.conf` (or `chrome-flags.conf` for Chrome):

    --enable-features=UseOzonePlatform
    --ozone-platform=wayland

[Reference](https://wiki.archlinux.org/title/chromium#Native_Wayland_support)

### Enable Native Wayland Support for Electron Apps

Add these flags to the command running the app:

    --enable-features=UseOzonePlatform --ozone-platform=wayland

To persist, you can add them to related `.desktop` file.

[Reference](https://www.reddit.com/r/linux/comments/lw7cvk/electron_12_has_just_been_released_with_wayland/)

### Status of Wayland Support in Other Apps

- [Jetbrains](https://youtrack.jetbrains.com/issue/JBR-3206)
- [VSCode](https://github.com/microsoft/vscode/issues/109176)


## HiDPI + Full HD Monitor Combination in Gnome

If you have multiple monitors (one HiDPI, and one with lower dpi):

1. Use Wayland
2. Enable the experimental fractional scaling feature of Wayland:

       $ gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
3. Open `Settings -> Displays`, and set Scale to your desired value for each monitor.


## HP Printer Setup

```
$ sudo pacman -S cups
$ sudo systemctl enable --now cups
$ sudo pacman -S hplip
$ sudo hp-setup -i
```

## Map Xiao AI Button

References:
- https://wiki.archlinux.org/title/map_scancodes_to_keycodes
- https://wiki.archlinux.org/title/Keyboard_input#Identifying_scancodes

My Xiaomi laptop's keyboard has a button for using Xiao AI in Windows,
but it was unusable in Linux. To use this button,
I found its scancode (`0x72`) and mapped it to a linux keycode.

To find the scancode, press the key and look for logs like this in `dmesg` output:

```
[ 8474.796476] atkbd serio0: Unknown key pressed (translated set 2, code 0x72 on isa0060/serio0).
[ 8474.796481] atkbd serio0: Use 'setkeycodes 72 <keycode>' to make it known.
```

Open list of linux keycodes and pick a keycode (e.g. `172`: HomePage):

    cat /usr/include/linux/input-event-codes.h | grep KEY_

### One-time mapping

    sudo setkeycodes 72 172


### Permanent mapping

Find your keyboard information with `evemu-describe` command (`evemu` package).

Create `/usr/lib/udev/hwdb.d/90-redmi.hwdb` and set mapping for your keyboard:

```
evdev:atkbd:dmi:bvn*:bvr*:bd*:svnTIMI:pnRedmiBookPro15:*
  KEYBOARD_KEY_72=172
```

Update `hwdb.bin`:

```
sudo systemd-hwdb update
```

After any change to `90-redmi.hwdb`, run `sudo touch /usr`.


## Fully Power Down Discrete GPU

This can be done using [bbswitch](https://github.com/Bumblebee-Project/bbswitch).

1. Install `bbswtich` package.

2. Create `/etc/modules-load.d/bbswitch.conf`:

       bbswitch
    
    This loads `bbswitch` kernel module at boot.

3. Create `/etc/modprobe.d/bbswitch.conf`:

       blacklist nouveau
       options bbswitch load_state=0

   This will:

   - prevent `nouveau` module (nvidia driver) from loading
   - configure bbswitch to turn the card off after loading

4. Update initial ramdisk:

       sudo mkinitcpio -P

5. Reboot.

To check the status of GPU (ON/OFF):

    cat /proc/acpi/bbswitch


## Monospace Fonts

My favorite monospace fonts:

- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [Iosevka](https://typeof.net/Iosevka/)
- [Source Code Pro](http://adobe-fonts.github.io/source-code-pro/)
- [Hasklig](https://github.com/i-tu/Hasklig)
- [Cascadia Code](https://github.com/microsoft/cascadia-code)


## Gnome Shell

### Switch Tabs only on Current Workspace

```
gsettings set org.gnome.shell.app-switcher current-workspace-only true
```

### Gnome Image Viewer: scroll up/down instead of zoom in/out

[Reference](https://gitlab.gnome.org/GNOME/eog/-/issues/84)

```
gsettings set org.gnome.eog.view scroll-wheel-zoom false
```


### Gnome Tweak Tool

- Install `xcursor-vanilla-dmz` package and in Gnome Tweak Tool, set Cursor to 'Vanilla-DMZ'.
- In "Windows" section, Enable "Maximize" and "Minimize" buttons.
- In "Fonts" section, set monospace font to "Source Code Pro"

### Extensions

- [ddterm](https://extensions.gnome.org/extension/3780/ddterm/)
- [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/)
- [Dash to Panel](https://extensions.gnome.org/extension/1160/dash-to-panel/)
- [Hide Activities Button](https://extensions.gnome.org/extension/4325/hide-activities-button/)
- [GTK Title Bar](https://extensions.gnome.org/extension/1732/gtk-title-bar/)
- [Arch Linux Updates Indicator](https://extensions.gnome.org/extension/1010/archlinux-updates-indicator/)
- [Disconnect Wifi](https://extensions.gnome.org/extension/904/disconnect-wifi/)
- [Persian Calendar](https://extensions.gnome.org/extension/240/persian-calendar/)
- [Iranian Persian Calendar](https://extensions.gnome.org/extension/3618/shamsi-calendar/)
- [Proxy Switcher](https://extensions.gnome.org/extension/771/proxy-switcher/)
- [Screenshot Locations](https://extensions.gnome.org/extension/1179/screenshot-locations/)
- [Sound Input & Output Device Chooser](https://extensions.gnome.org/extension/906/sound-output-device-chooser/)
- [system-monitor-next](https://extensions.gnome.org/extension/3010/system-monitor-next/)


## Note-taking

Install Typora, Joplin or MarkText.
