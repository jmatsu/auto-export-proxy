#!/bin/bash

FILE_LOCATION=`which $0`
FILE_LOCATION=${FILE_LOCATION%/*}

. "${FILE_LOCATION}/public.fnc"

SSID_NAME=`show_ssid`

if [ ! -f "${FILE_LOCATION}/.$SSID_NAME" ]; then
	echo "${FILE_LOCATION}/.$SSID_NAME not found. import default settings."
	SSID_NAME="default_proxy"
fi

read_proxy "${FILE_LOCATION}/.${SSID_NAME}"

. "${FILE_LOCATION}/${SSID_NAME}.fnc"

post_export

echo "Please waiting for getting IP-address."