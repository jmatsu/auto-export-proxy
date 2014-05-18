auto-export-proxy
========================

This script make exporting proxy settings easy for OSX.

This read current SSID from Airport and export proxy settings from {SSID}.

### Directory structure

+ auto-export-proxy
	- build (for script creation.)
	- LICENSE
	- defaults
		* public.fnc
		* main.fnc
	- functions
		* default_proxy (default proxy settings.)
		* titech-pubnet (proxy settings for titech-pubnet.)
	- settings
		* default_proxy.fnc (functions for default)
		* titech-pubnet.fnc (functions for titech-pubnet)

### How to use

1. cd /path/to/auto-export-proxy
1. If you are a student of Tokyo Institute of Technology, you should modify titech-pubnet.fnc
1. exec ./build

Next statement should be written on .yourshrc
	
	[ -f ~/auto-export-proxy.sh ] && source ~/auto-export-proxy.sh

### Extension

settings/{SSID} is {SSID}'s proxy settings list.

        http_proxy {proxy:port} [RET]
        https_proxy {proxy:port} [RET]
        no_proxy {noproxy} [RET] (<- this [RET] must be required!

functions/{SSID}.fnc must implement 'post_export' function.

      (eg... use 'curl' for login.)
      It can be empty function if you would like to do nothing.