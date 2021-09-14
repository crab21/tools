# Build the manager binary
FROM golang:1.17.1-alpine as builder

WORKDIR /workspace

# Copy the go source
COPY . .

# Build
RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && export CGO_ENABLED=0  \
    && export GOOS=linux \
    && export GOARCH=amd64  \
    && export GO111MODULE=on \
    ## go必须的
    && apk add --no-cache upx ca-certificates tzdata git \
    && apk add --no-cache graphviz=2.47.1-r0 \
    && apk add --no-cache wrk=4.1.0-r2 \
    && go install -v github.com/google/pprof@latest \
    && git clone https://github.com/brendangregg/FlameGraph.git \
    && export PATH=$PATH:$GOPATH/FlameGraph \
    && go install -v  github.com/uber/go-torch@latest

CMD [ "tail","-f","/dev/null" ]