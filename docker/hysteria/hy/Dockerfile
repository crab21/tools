FROM debian

WORKDIR /workspace
COPY . .
RUN chmod +x /workspace/hysteria-linux-amd64
CMD [ "/workspace/hysteria-linux-amd64","--log-level", "warn","-c","/hy.json"]