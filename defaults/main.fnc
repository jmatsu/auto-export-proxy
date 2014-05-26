SSID_NAME=`show_ssid`

if ! type "export_$SSID_NAME" >/dev/null 2>&1; then
	SSID_NAME="default_proxy"
fi

SSID_ESCAPED=`echo $SSID_NAME | sed -e 's/-/_/g'`

export_${SSID_ESCAPED}

${SSID_ESCAPED}_post_export

echo "Please waiting for getting IP-address."