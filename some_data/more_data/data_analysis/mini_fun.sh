#!/bin/bash

number=""
word=""

# Parse named arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    -number)
      number="$2"
      shift 2
      ;;
    -word)
      word="$2"
      shift 2
      ;;
    -h|--help)
      echo "Usage: ./mini_fun.sh [-number <value>] [-word <name>]"
      echo "  -number   A number to divide by 4 (supports decimals)"
      echo "  -word     A name or message for the love note"
      echo ""
      echo "You can use one or both options."
      echo "Examples:"
      echo "  ./mini_fun.sh -number 8"
      echo "  ./mini_fun.sh -word Luna"
      echo "  ./mini_fun.sh -number 12 -word Socks"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      echo "Run with --help for usage info."
      exit 1
      ;;
  esac
done

# Handle outputs
if [[ -n "$number" ]]; then
  result=$(echo "scale=2; $number / 4" | bc)
  echo "$result"
fi

if [[ -n "$word" ]]; then
  echo "I love you, $word!"
fi

if [[ -z "$number" && -z "$word" ]]; then
  echo "❗ You must provide at least one argument."
  echo "Try: ./mini_fun.sh -number 4"
  echo "  or: ./mini_fun.sh -word Luna"
  exit 1
fi

