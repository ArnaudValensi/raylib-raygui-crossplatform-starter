#!/bin/bash

print_usage() {
  echo "Usage: ./run.sh <command>"
  echo
  echo "    build"
  echo "        Build all."
  echo
  echo "    clean"
  echo "        Clean built files."
  echo
}

run_tests() {
  clang tests/main.c -o test_runner && ./test_runner
}

if [[ ! $# -gt 0 ]]; then
  print_usage
  exit 0
fi

if [[ $1 == "build" ]]; then
  make
  exit 0
fi

if [[ $1 == "clean" ]]; then
  make clean
  exit 0
fi
