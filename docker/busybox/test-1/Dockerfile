FROM busybox
WORKDIR /ko-app/
USER root
ENV TZ=Asia/Shanghai
RUN apk --update  --no-cache add tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone &&  \
    # apk del tzdata && \
    rm -rf /var/cache/apk/*
ENTRYPOINT ["tail","-f","/dev/null"]