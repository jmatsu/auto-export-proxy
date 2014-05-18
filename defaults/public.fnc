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