#!/bin/bash

# /root/crab/tools/docker/naive/Caddyfile:/koo/Caddyfile
# /root/crab/tools/docker/naive/Caddyfile 可以覆盖镜像中的 Caddyfile文件

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

cat > /root/Caddyfile << EOF
:443, xxx.xxx.com
{
	tls imrcrab@163.com {
		protocols tls1.2 tls1.3
		ciphers TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 TLS_RSA_WITH_AES_128_GCM_SHA256
	}

	header {
		Strict-Transport-Security "max-age=15768000; preload"
		X-XSS-Protection "1; mode=block"
		X-Content-Type-Options "nosniff"
		X-Frame-Options "DENY"
	}

	route {
		forward_proxy {
			basic_auth admin QTl75t5CyBbNzsI0e4sCtJjBEYm7gL3zNuVjrgX9gpRllvRHsTF3BfBwfPGNCSERveTrHpkcbgEYFxd32M42zlnQ6vV8KL0e0um
			hide_ip
			hide_via
			probe_resistance
		}
		file_server { root /koo/wwwhtml }
	}
}
EOF

sudo systemctl enable docker
sudo systemctl start docker

docker run -it --restart=always --name naive93v0.0.2 -v /root/Caddyfile:/koo/Caddyfile naive-server:v0.2

echo "请修改 /root/Caddyfile 文件中的域名，并重启docker镜像：
    docker restart naive93v0.0.2
    
    如果要修改用户名和密码，请修改 basic_auth行后面的用户名和密码，如： basic_auth admin password"

