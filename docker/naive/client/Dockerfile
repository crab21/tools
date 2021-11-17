# Build the manager binary
FROM centos:latest

WORKDIR /workspace

# Copy the go source
COPY naiveproxy96 .

RUN chmod -R 777 /workspace/naiveproxy96 \
    # && yum -y update \
    && rpm -ivh http://mirrors.wlnmp.com/centos/wlnmp-release-centos.noarch.rpm \
    # && yum -y install wntp
    && yum -y install chrony
ENTRYPOINT [ "/bin/sh","st.sh" ]