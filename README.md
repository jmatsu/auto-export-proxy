auto-export-proxy
========================

This script make exporting proxy settings easy for OSX.

This read current SSID from Airport and export proxy settings from {SSID}.

### How to use

If you are a student of Tokyo Institute of Technology and would like to use this, this requires a network environment.

1. Create a network environment for titech-pubnet.
1. Configure variables on resourses

Next statement should be written on .yourshrc

	[ -f /path/to/auto-export-proxy.sh ] && source /path/to/auto-export-proxy.sh

#### This script includes exporting some variables, so

### For extension

Please edit along with the format of the sample-export.sh, and rename to other-export.sh