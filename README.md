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
		* function_templete (templete for function)
		* default_proxy.fnc (functions for default)
		* titech-pubnet.fnc (functions for titech-pubnet)
	- resources
		* defaults.resource (shared resource. eg... the name of default network enviroment)
		* unique.resource (unique resource.)
	- settings
		* settings_templete (templete for proxy settings.)
		* default_proxy.settings (default proxy settings.)
		* titech-pubnet.settings (proxy settings for titech-pubnet.)

### How to use

1. $ cd /path/to/auto-export-proxy
1. $ $EDITOR resources/unique.resource (if you are a student of Tokyo Institute of Technology.
1. $ ./build

Next statement should be written on .yourshrc
	
	[ -f ~/auto-export-proxy.sh ] && source ~/auto-export-proxy.sh

#### ./build must be executed when you add new ssid's settings.

### For extension

settings/{SSID} is {SSID}'s proxy settings list. (Show templete)

        http_proxy {proxy:port} [RET]
        https_proxy {proxy:port} [RET]
        no_proxy {noproxy} [RET] (<- this [RET] must be required!

functions/{SSID}.fnc must implement 'post_export' function. (Show templete)

      (eg... use 'curl' for login. show titech-pubnet.fnc)
      It can be empty function if you would like to do nothing.