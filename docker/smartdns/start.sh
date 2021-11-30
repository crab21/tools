#!/bin/bash


docker run -itd --restart=always --network=host -v /etc/localtime:/etc/localtime --name smartdns -p 5355  smartdns:v0.1