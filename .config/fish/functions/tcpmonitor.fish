# Monitor the TCP traffic on the specified port
function tcpmonitor
    sudo /usr/sbin/tcpdump -ln -A -s1024 -i $argv[1] tcp port $argv[2]
end