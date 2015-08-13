################################################################################
# Copyright (c) 2014 Matsuda Jumpei(https://github.com/jmatsu)
# Name: atproxy, auto-export-proxy
# License: MIT LICENSE
# Description:
#   This script can automatically log in and export proxy-settings on Mac OS X.
################################################################################

function atproxy() {
  export no_proxy="localhost, wlanauth.noc.titech.ac.jp"

  echo "Current ssid is `${atproxy_location}/encapsulated_functions.sh show_ssid`"

  local escaped=`${atproxy_location}/encapsulated_functions.sh "show_escaped_ssid"`

  local line
  while read line; do
    eval "$line"
  done < <(${atproxy_location}/encapsulated_functions.sh "export_${escaped}")
  
  ${atproxy_location}/encapsulated_functions.sh "${escaped}_post_export"

  echo "Finished. please wait a moment."
}

atproxy_location=`dirname $0`

atproxy

unset atproxy_location