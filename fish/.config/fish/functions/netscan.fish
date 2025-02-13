# Scan the network for devices
function netscan
    ifconfig | grep broadcast
    arp -a | grep :
end