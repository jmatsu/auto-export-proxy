SSID_NAME=`$AIRPORT_COMMAND -I | grep '\ SSID' | awk '{print $2}'`

has_ip(){
    return [ `ifconfig en0|grep "inet [0-9]"|wc -l` = 1 ]
}

equals_ssid()
{
	return "$SSID_NAME" = "$1"
}