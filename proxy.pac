function FindProxyForURL(url, host) {
    clientAddr = myIpAddress();

    if (isInNet(clientAddr, "131.112.0.0", "255.255.0.0")) {
        return FindProxyForURLTITECH(url, host, clientAddr);
    }

    return "DIRECT";
}

function FindProxyForURLTITECH(url, host, clientAddr) {
    wwwAddr = dnsResolve(host);

    if (isPlainHostName(host) ||
     isInNet(wwwAddr, "131.112.253.250","255.255.255.255") ||
     isInNet(wwwAddr, "127.0.0.0", "255.0.0.0")){
        return "DIRECT";
    } else if (isInNet(clientAddr, "131.112.192.0", "255.255.248.0") ||
     isInNet(clientAddr, "131.112.208.0", "255.255.252.0")) {
        return "PROXY 131.112.125.238:3128;";
    } else if (isInNet(clientAddr, "131.112.200.0", "255.255.248.0")||
     isInNet(clientAddr, "131.112.212.0", "255.255.252.0")) {
        return "DIRECT";
    } else if (isInNet(clientAddr, "131.112.0.0", "255.255.0.0") ||
     isInNet(clientAddr, "172.16.0.0", "255.240.0.0")||
     isInNet(clientAddr, "10.255.0.0", "255.255.0.0")) {
        if (isInNet(wwwAddr, "131.112.0.0", "255.255.252.0") ||
         isInNet(wwwAddr, "131.112.4.0", "255.255.255.0") ||
         isInNet(wwwAddr, "131.112.14.0", "255.255.255.0") ||
         isInNet(wwwAddr, "131.112.119.0", "255.255.255.0") ||
         isInNet(wwwAddr, "131.112.123.0", "255.255.255.192") ||
         isInNet(wwwAddr, "131.112.125.0", "255.255.255.0") ||
         isInNet(wwwAddr, "131.112.160.0", "255.255.255.0") ||
         isInNet(wwwAddr, "131.112.181.0", "255.255.255.0") ||
         isInNet(wwwAddr, "172.17.0.0", "255.255.0.0") ||
         isInNet(wwwAddr, "172.30.1.0", "255.255.255.0")) {
            return "DIRECT";
        } else {
            return "PROXY 131.112.125.238:3128;";
        }
    } else {
        return "DIRECT";
    }
}