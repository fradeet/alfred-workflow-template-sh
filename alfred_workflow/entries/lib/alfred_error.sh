alfred_error() {
  jq -cn --arg message "$1" '{items: [{title: "Unable to Load Results", subtitle: $message, valid: false}]}'
}
