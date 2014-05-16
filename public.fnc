AIRPORT_COMMAND="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
SSID_NAME=` $AIRPORT_COMMAND -I | grep '\ SSID' | awk '{print $2}'`

show_ssid()
{
	echo "$SSID_NAME"
}

equals_ssid()
{
	return "$SSID_NAME" = "$1"
}

read_proxy()
{
	while read param value
	do
		echo "Detect $param settings."
		if [ "${param}" = "no_proxy" ]; then
			COUNT_NO_PROXY=`echo $no_proxy | grep "${value}" | wc -w`
			if [ $COUNT_NO_PROXY -eq 0 ]; then
				echo "Set no_proxy settings."
        		export no_proxy="$no_proxy, $value"
   			fi
		else
			export ${param}="${value}"
		fi
	done < $1
}