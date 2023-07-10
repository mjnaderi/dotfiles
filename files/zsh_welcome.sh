greetings() {
  echo "  Hey Mohammad Javad!"
}

check_downloadupdates() {
  if [ -f /var/log/downloadupdates_done ]; then
    echo "  Pacman updates have been downloaded."
    echo
    journalctl --since="-24h" -u downloadupdates | grep -E ' Starting | Packages | Download Size:| Finished ' --color=never | python -c 'import fileinput, textwrap, re; print("".join([re.sub(r"^(.*? Packages \(.*?\))(.*)", r"\1", line ) + "    " + "\n    ".join(textwrap.wrap(line.split(") ")[1], width=90, break_on_hyphens=False)) + "\n" if " Packages " in line else line for line in fileinput.input()]), end="")' | sed 's/^/  /'
    echo
    echo "  View logs:"
    echo
    echo "       $ journalctl -u downloadupdates --since='-24h'"
    echo
    echo "  Install updates manually:"
    echo
    echo "       $ installupdates"
    echo
  fi
}

installupdates() {
  sudo pacman -Syu && sudo rm /var/log/downloadupdates_done
}

space-invaders
greetings
check_downloadupdates