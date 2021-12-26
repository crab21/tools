# Build the manager binary
FROM centos:latest

WORKDIR /workspace

# Copy the go source
COPY . .

RUN yum install -y wget \
    && wget -v -O hysteria https://github.com/HyNetwork/hysteria/releases/download/v0.9.2/hysteria-linux-amd64 \
    && chmod +x hysteria 
ENTRYPOINT [ "/bin/sh","st.sh" ]