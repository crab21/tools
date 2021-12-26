
<!-- 启动命令 -->
docker run -itd --restart=always --network=gogo --name hystriex-client -p 408:1080 -v /root/hystriex.json:/workspace/config  -v /etc/localtime:/etc/localtime  imrcrab/hystriex-client:v0.1