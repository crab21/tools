# Build the manager binary
FROM alpine:latest

WORKDIR /workspace

# Copy the go source
COPY . .

RUN chmod -R 777 v2ray 
ENTRYPOINT [ "/bin/sh","st.sh" ]
EXPOSE 1080
EXPOSE 1089