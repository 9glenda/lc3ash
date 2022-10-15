#!/bin/sh
test() {
  ./lc3ash "$1/main.asm"
  lc3as "$1/main.asm" > /dev/null
  file1="$(hexdump -C "$1/main.asm.out")"
  file2="$(hexdump -C "$1/main.obj")"
  if [ ! "$file1" == "$file2" ]; then
    printf 'TEST FAILED %s\nlc3ash:\n%s\nlc3as:\n%s' "$1" "$file1" "$file2"
  else
    printf 'TEST PASSED %s\n' "$1"
  fi
  rm "$1/main.asm.out" "$1/main.obj" "$1/main.sym"
}
shellcheck lc3ash
test tests/halt
test tests/halt2
test tests/fill
