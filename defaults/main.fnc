SSID_ESCAPED=`echo $SSID_NAME | sed -e 's/-/_/g'`

if ! type "export_$SSID_ESCAPED" >/dev/null 2>&1; then
	SSID_ESCAPED="default_proxy"
fi

export_${SSID_ESCAPED}

${SSID_ESCAPED}_post_export

echo "Please waiting for getting IP-address."