#!/bin/sh
set -eou pipefail
tests=0
passed=0
test() {
  tests=$((tests+1))
  ./lc3ash "tests/$1/main.asm"
  lc3as "tests/$1/main.asm"  2>/dev/null 1>&2
  file1="$(hexdump -C "tests/$1/main.asm.out")"
  file2="$(hexdump -C "tests/$1/main.obj")"
  if [ ! "$file1" = "$file2" ]; then
    printf 'TEST FAILED %s\nlc3ash:\n%s\nlc3as:\n%s' "$1" "$file1" "$file2"
    # failed=$((failed+1))
  else
    printf 'TEST PASSED %s\n' "$1" # "$lc3ash_time" "$lc3as_time"
    passed=$((passed+1))
  fi
  rm "tests/$1/main.asm.out" "tests/$1/main.obj" "tests/$1/main.sym"
}
shellcheck lc3ash test.sh
test getc
test out
test puts
test in
test putsp
test halt
test orig_decimal
test fill
test helloworld
test 2labels
test 3labels
test end
test lea
test ld
test ldi
test st
test sti
test jmp
test big_file
printf 'TESTS PASSED: (%s/%s)' "$passed" "$tests"
exit $((tests-passed))
