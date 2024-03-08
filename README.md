# My Dotfiles

This is my dotfiles repository. You can learn more about dotfiles [here](https://dotfiles.github.io/).

I use Ansible for better flexibility. The main Ansible tasks are located in
[`roles/dotfiles/tasks`](https://github.com/mjnaderi/dotfiles/tree/main/roles/dotfiles/tasks).

## Requirements

```shell
# Install ansible and requirements
$ sudo pacman -S ansible
$ ansible-galaxy install -r requirements.yml
```

## Installation

Copy `.env.sample` to `.env` and configure environment variables. Then run the playbook:

```shell
$ ./install.sh
```

You can pass ansible-playbook arguments to `install.sh`:

```shell
$ ./install.sh --tags gnome
$ ./install.sh --skip-tags fonts,proxy
```

You can find the list of tags in `roles/dotfiles/tasks/main.yml`.

After installing, do not move dotfiles repository. If you did that, install once again.

## Manual Configurations

Here I explain some manual configurations that are hard to automate,
or I was too lazy to automate!

## Wayland

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

    $ cat /usr/include/linux/input-event-codes.h | grep KEY_

### One-time mapping

    $ sudo setkeycodes 72 172

### Permanent mapping

Find your keyboard information with `evemu-describe` command (`evemu` package).

Create `/usr/lib/udev/hwdb.d/90-redmi.hwdb` and set mapping for your keyboard:

```
evdev:atkbd:dmi:bvn*:bvr*:bd*:svnTIMI:pnRedmiBookPro15:*
  KEYBOARD_KEY_72=172
```

Update `hwdb.bin`:

    $ sudo systemd-hwdb update

After any change to `90-redmi.hwdb`, run `sudo touch /usr`.

## Monospace Fonts

My favorite monospace fonts:

- [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- [Iosevka](https://typeof.net/Iosevka/)
- [Source Code Pro](http://adobe-fonts.github.io/source-code-pro/)
- [Hasklig](https://github.com/i-tu/Hasklig)
- [Cascadia Code](https://github.com/microsoft/cascadia-code)

Use a [nerd font](https://www.nerdfonts.com/) for better compatibility with shell prompts
like Powerlevel10k or Starship. This dotfiles repo installs some nerd fonts.
