# Build the manager binary
FROM centos:latest

WORKDIR /workspace

# Copy the go source
COPY . .

RUN yum -y update \
    && yum install -y wget \
    && wget https://github.com/pymumu/smartdns/releases/download/Release30/smartdns.1.2020.02.25-2212.x86_64-linux-all.tar.gz \
    && tar zxf smartdns.1.2020.02.25-2212.x86_64-linux-all.tar.gz \
    && cd smartdns \
    && chmod +x ./install \
    && ./install -i \
ENTRYPOINT [ "/bin/sh","st.sh" ]