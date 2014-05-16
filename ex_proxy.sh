#!/bin/bash

. ./public.fnc

SSID_NAME=`show_ssid`

if [ ! -f ".$SSID_NAME" ]; then
	echo ".$SSID_NAME not found. import default settings."
	SSID_NAME="default_proxy"
fi

read_proxy "./.${SSID_NAME}"

. "./${SSID_NAME}.fnc"

post_export

echo "Please waiting for getting IP-address."