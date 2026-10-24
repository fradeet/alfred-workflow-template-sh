verbose_log() {
  (( ${args[--verbose]:-0} >= 1 )) || return 0
  printf '[INFO] %s\n' "$*" >&2
}

verbose_debug() {
  (( ${args[--verbose]:-0} >= 2 )) || return 0
  printf '[DEBUG] %s\n' "$*" >&2
}
