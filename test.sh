#!/bin/sh
tests=0
failed=0
test() {
  tests=$((tests+1))
  lc3ash_time="$(./lc3ash "tests/$1/main.asm")"
  lc3as_time="$(lc3as "tests/$1/main.asm")"
  file1="$(hexdump -C "tests/$1/main.asm.out")"
  file2="$(hexdump -C "tests/$1/main.obj")"
  if [ ! "$file1" == "$file2" ]; then
    printf 'TEST FAILED %s\nlc3ash:\n%s\nlc3as:\n%s' "$1" "$file1" "$file2"
    failed=$((failed+1))
  else
    printf 'TEST PASSED %s\n' "$1" # "$lc3ash_time" "$lc3as_time"
  fi
  rm "tests/$1/main.asm.out" "tests/$1/main.obj" "tests/$1/main.sym"
}
shellcheck lc3ash
test halt
test orig_decimal
test fill
test helloworld
test 2labels
test 3labels
test lea
test ld
test ldi
test st
test sti
test jmp
test big_file
printf 'TESTS FAILED: (%s/%s)' "$failed" "$tests"
