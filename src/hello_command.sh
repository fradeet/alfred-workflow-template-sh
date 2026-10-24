verbose_log 'Generating Alfred result'
jq -cn '{items: [{title: "Hello Alfred", subtitle: "Bashly + Alfred", valid: false}]}'
