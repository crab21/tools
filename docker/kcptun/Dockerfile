FROM debian

WORKDIR /workspace
COPY . .
# 20220628
RUN chmod +x /workspace/client_linux_amd64
CMD [ "/workspace/client_linux_amd64","-c","/kcptun.json"]