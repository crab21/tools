FROM debian

WORKDIR /workspace
COPY . .
RUN chmod +x /workspace/xray \
    &  chmod +x /workspace/v2ray-plugin_linux_amd64
CMD [ "/workspace/xray","run","-c","/ss2022.json"]