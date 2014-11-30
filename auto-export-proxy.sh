#!/usr/bin/env bash

## ===== Information.s =====

# Copyright (c) 2014 Matsuda Jumpei(https://github.com/jmatsu)
# Name: auto-export-proxy.sh
# License: MIT LICENSE
# Description:
#              This script can automatically log in and export proxy-settings on Mac OS X.
#              In particular, for students of Tokyo Institute of Technology.

## ===== Information.e =====

get_ssid()
{
    local AIRPORT_COMMAND="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport"
    $AIRPORT_COMMAND -I | grep '\ SSID' | awk '{print $2}'
}

wifi_switch()
{
    networksetup -setairportpower en0 $1
}

wait_for_assigning_ip()
{
    local _count=0
    while :
    do
        [ `ifconfig en0|grep "inet "|wc -l` = 1 ] && break # half space after "inet" is very important
        echo 'Retry after 2 seconds...'
        sleep 2
        _count=`expr ${_count} + 1`
        if [ $_count gt 6 ]; then
            echo 'Maybe, assigning ip address is failure.'
            return false
        fi
    done

    echo 'Confirm to assign ip address.'
    return true
}

authorize_titech()
{
        local TP_LOGIN_URL="https://wlanauth.noc.titech.ac.jp/login.html"

        # login
        _CURL_RESULT=$(curl $TP_LOGIN_URL -X POST -d buttonClicked=4 -d "username=${TITECH_STUDENT_ID}&password=${TITECH_PASSWORD}" 2>&1)

        local STATUS_CODE=` echo $CURL_RESULT | grep 'statusCode' | sed -e 's/^.*[statusCode=]//g' -e 's/\".*//g'`

        case $STATUS_CODE in
            1) echo "You are already logged in.";;
                # u are already logged in.
            2) echo "You needn't authenticate against web portal.";;
                # u needn't authenticate against web portal..
            3) echo "Your account specified cannnot be used now. Perhaps already logged into the system (by other device).";;
                # ur account specified cannnot be used now. Perhaps already logged into the system.
            4) echo "Your account has been excluded. Please contact the Admin.";;
                # ur account has been excluded.
            5) echo "Invalid your account. Rewrite your information.";;
                # invalid username and TITECH_PASSWORD.
            *) echo "No error status code was returned"
                return true;;
        esac

        return false;
}

default_proxy_post_export()
{
    scselect $DEFAULT_ENV_NAME
}

titech_pubnet_post_export()
{
    scselect $TITECH_NETWORK_ENV

    if wait_for_assigning_ip; then
        echo 'Now authorizing...'

        if authorize_titech; then
            # wifi off -> on (There is a case which needs to reboot wifi)
            echo 'Reboot wifi'
            wifi_switch off
            wifi_switch on
            sleep 4

            echo 'Retry the authorization for checking...'
            if authorize_titech; then
                echo 'Auto log-in is successful.'
            else
                echo 'Auto log-in is failure.'
            fi
        fi
    fi
}

export_default_proxy()
{
    export http_proxy=
    export https_proxy=
    export ALL_PROXY=
}

export_titech_pubnet()
{
    local PROXY_ADDRESS="http://proxy.noc.titech.ac.jp:3128"
    export http_proxy=${PROXY_ADDRESS}
    export https_proxy=${PROXY_ADDRESS}
    export ALL_PROXY=${PROXY_ADDRESS}
}

run_main()
{
    local SSID_NAME=`get_ssid`
    local SSID_ESCAPED=`echo $SSID_NAME | sed -e 's/-/_/g'`

    if ! type "export_${SSID_ESCAPED}" >/dev/null 2>&1; then
        SSID_ESCAPED="default_proxy"
    fi

    echo "Current SSID / "$SSID_NAME

    # wlan... must be required.
    export no_proxy="localhost, wlanauth.noc.titech.ac.jp"
    export_${SSID_ESCAPED}
    ${SSID_ESCAPED}_post_export

    echo "Done. Please wait a moment."
}

_SCRIPT_LOCATION="$(builtin cd "$(dirname "${BASH_SOURCE:-${(%):-%N}}")"; pwd)"
_RESOURCES_LOCATION="${_SCRIPT_LOCATION}/resources"
_OTHER_EXPORT_LOCATION="${_SCRIPT_LOCATION}/other-export.sh"

[ -f ${_RESOURCES_LOCATION} ] && . ${_RESOURCES_LOCATION} && echo 'Load resources.'
[ -f ${_OTHER_EXPORT_LOCATION} ] && . ${_OTHER_EXPORT_LOCATION} && echo 'Load other-export.'

run_main
