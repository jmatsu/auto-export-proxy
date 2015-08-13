################################################################################
# Copyright (c) 2014 Matsuda Jumpei(https://github.com/jmatsu)
# Name: atproxy, auto-export-proxy
# License: MIT LICENSE
# Description:
#   This script can automatically log in and export proxy-settings on Mac OS X.
################################################################################

function atproxy() {
  export no_proxy="localhost, wlanauth.noc.titech.ac.jp"

  echo "Current SSID is `./encapsulated_functions show_ssid`"

  local escaped=`./encapsulated_functions.sh "show_escaped_ssid"`

  local line
  while read line; do
    eval "$line"
  done < <(./encapsulated_functions.sh "export_${escaped}")
  
  ./encapsulated_functions.sh "${escaped}_post_export"

  echo "Finished. please wait a moment."
}

atproxy