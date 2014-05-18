SSID_NAME=`show_ssid`

if ! type "export_$SSID_NAME" >/dev/null 2>&1; then
	SSID_NAME="default_proxy"
fi

export_${SSID_NAME}

${SSID_NAME}_post_export

echo "Please waiting for getting IP-address."