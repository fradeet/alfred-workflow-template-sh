level=${args[--verbose]:-0}
verbose_log 'Verbose output is enabled'
verbose_debug 'Debug output is enabled'
printf 'Verbose level: %s\n' "$level"
