# Build the manager binary
FROM golang:1.17 as build-env



# Copy the go source
COPY / /workspace

WORKDIR /workspace
RUN ls -all /workspace
RUN chmod -R 777 /workspace/naiveproxy96 
    # && yum -y update \
    # && rpm -ivh http://mirrors.wlnmp.com/centos/wlnmp-release-centos.noarch.rpm \
    # && yum -y install wntp
    # && yum -y install chrony
RUN ls -all /workspace/naiveproxy96


FROM gcr.io/distroless/cc-debian10
WORKDIR /workspace

COPY --from=build-env /workspace/naiveproxy96/* /
CMD [ "/naive","--insecure-concurrency=8","/config.json"]