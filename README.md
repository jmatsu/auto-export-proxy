easy_shell_proxy_for_mac
========================

This script make exporting proxy settings easy. Written in ShellScript. (not executable.)

This read current SSID from Airport and export proxy settings from .{SSID}.

### How to use

Next two statements should be written on .yourshrc

	export PATH=/path/to/this/:$PATH
	. exproxy

.default_proxy and default_proxy.fnc are functions for default-setting.

.{SSID} is {SSID}'s proxy settings list.

        http_proxy {proxy:port} [RET]
        https_proxy {proxy:port} [RET]
        no_proxy {noproxy} [RET] (<- this [RET] must be required!

{SSID}.fnc must implement 'post_export' function.

      (eg... use 'curl' for login.)
      It can be empty function if you would like to do nothing.