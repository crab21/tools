
cat >> /etc/smartdns/smartdns.conf << EOF
cache-size 0

server-tcp 114.114.114.114
server-tcp 114.114.115.115
server-tcp 223.5.5.5
server-tcp 223.6.6.6
server-tcp 180.76.76.76
server-tcp 119.29.29.29
server-tcp 182.254.116.116

server-tls 8.8.8.8
server-tls 8.8.4.4
server-tls 1.1.1.1
server-tls 1.1.0.0
EOF
/usr/sbin/smartd -n -q never &
tail -f /dev/null