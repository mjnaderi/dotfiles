#!/usr/bin/env bash

# Space Invaders
# Source: https://github.com/robole/fetching/blob/main/fetching-scripts/games/space-invaders-l

f=3 b=4

for j in f b; do
  for i in {0..7}; do
    printf -v $j$i %b "\e[${!j}${i}m"
  done
done

for i in {0..7}; do
    printf -v fbright$i %b "\e[9${i}m"
done

bld=$'\e[1m'
rt=$'\e[0m'

# Symbols:
# █ ■ ▄ ▀ ▐ ▌ ▬ ▓ ▒ ░  ● ═ ║ ╔ ╦ ╗ ╚ ╩ ╝ ▲ ▼ ◄ ►
# ◐ ◑ ◒ ◓  ͻ ͼ ͽ Δ Ѻ ∟ ┌ ┐└ ┘┘

# colors:
# f0=black, f1=red, f2=green, f3=yellow, f4=blue
# f5=magenta, f6=cyan, f7=white
#
# g0=bright black, g1=bright red, g2=bright green, g3=bright yellow,
# g4=bright blue, g5=bright magneta, g6=bright cyan, f7=bright white

cat << EOF

  $f1  ▀▄   ▄▀     $f2 ▄▄▄████▄▄▄    $f3  ▄██▄     $f4  ▀▄   ▄▀     $f5 ▄▄▄████▄▄▄    $f6  ▄██▄
  $f1 ▄█▀███▀█▄    $f2███▀▀██▀▀███   $f3▄█▀██▀█▄   $f4 ▄█▀███▀█▄    $f5███▀▀██▀▀███   $f6▄█▀██▀█▄
  $f1█▀███████▀█   $f2▀▀███▀▀███▀▀   $f3▀█▀██▀█▀   $f4█▀███████▀█   $f5▀▀███▀▀███▀▀   $f6▀█▀██▀█▀
  $f1▀ ▀▄▄ ▄▄▀ ▀   $f2 ▀█▄ ▀▀ ▄█▀    $f3▀▄    ▄▀   $f4▀ ▀▄▄ ▄▄▀ ▀   $f5 ▀█▄ ▀▀ ▄█▀    $f6▀▄    ▄▀

EOF
