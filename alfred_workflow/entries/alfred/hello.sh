#!/usr/bin/env bash
set -euo pipefail

workflow_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)
source "$workflow_dir/entries/lib/alfred_error.sh"

if ! result=$("$workflow_dir/template-cli" hello); then
  alfred_error 'Open the workflow debugger and try again'
  exit 0
fi

printf '%s\n' "$result"
