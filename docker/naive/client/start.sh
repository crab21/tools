#!/bin/bash


docker run -itd --restart=always --network=host -v /etc/localtime:/etc/localtime --name naive95-client -p 10800:10800  naive-client:v0.1.96