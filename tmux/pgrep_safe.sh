#!/usr/bin/env bash
# Cheap, newline-safe replacement for the stock "ps" strategy.
#
# The stock ps.sh runs `ps -ao ppid,args` — a full process-table dump — once per
# pane, then text-matches it. At ~90 panes that is ~90 whole-table scans per save,
# and concurrent saves serialize on the kernel process-table lock.
#
# pgrep -P asks the kernel for one pane's children directly; `ps -o args= -p`
# then formats them with embedded newlines escaped as \012, exactly as the stock
# strategy does. (The shipped pgrep.sh uses `pgrep -lf`, which emits RAW newlines
# and corrupts the tab-delimited save file for panes running multi-line commands.)
PANE_PID="$1"

exit_safely_if_empty_ppid() {
  if [ -z "$PANE_PID" ]; then
    exit 0
  fi
}

full_command() {
  local kids
  kids="$(\pgrep -P "$PANE_PID" | tr '\n' ',' | sed 's/,$//')"
  if [ -n "$kids" ]; then
    ps -o args= -p "$kids"
  fi
}

main() {
  exit_safely_if_empty_ppid
  full_command
}
main
