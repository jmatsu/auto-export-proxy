#!/usr/bin/env bash

# if SSID is "hoge"
hoge_post_export()
{
    # The name of network environment
    local HOGE_ENV_NAME="HOGE"

    scselect $HOGE_ENV_NAME

    if wait_for_assigning_ip; then

    fi
}

export_hoge()
{
    local PROXY_ADDRESS="http://hoge.com"
    export http_proxy=${PROXY_ADDRESS}
    export https_proxy=${PROXY_ADDRESS}
    export ALL_PROXY=${PROXY_ADDRESS}
}