FROM golang:1.18-bullseye as build
ARG PROTOC_VERSION=3.20.0
WORKDIR /opt

ADD . .

RUN go install -v github.com/envoyproxy/protoc-gen-validate@latest &&\
    go install -v github.com/go-swagger/go-swagger/cmd/swagger@latest &&\
    go install -v github.com/golang/mock/mockgen@latest &&\
    go install -v github.com/golangci/golangci-lint/cmd/golangci-lint@latest &&\
    go install -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway@latest &&\
    go install -v github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest &&\
    go install -v google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest &&\
    go install -v google.golang.org/protobuf/cmd/protoc-gen-go@latest 
    

RUN arch="$(uname -m)"; \
    if [ "$arch" = "aarch64" ]; then \
    arch="aarch_64"; \
    fi; \
    os="$(uname -s)"; \
    case "$os" in \
    Linux) os="linux" ;; \
    Darwin) os="osx" ;; \
    esac; \
    curl -sSLo protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-${os}-${arch}.zip; \
    apt-get update; \
    apt-get install -y unzip; \
    unzip protoc.zip


FROM golang:1.18-bullseye

COPY --from=build /go/bin/ /go/bin/
COPY --from=build /opt/bin/protoc /usr/local/bin/
COPY --from=build /opt/include /usr/local/
COPY --from=build /opt/protoc-gen-qcloudapi /go/bin/protoc-gen-qcloudapi
RUN chmod +x /go/bin/protoc-gen-qcloudapi
CMD [ "tail","-f","/dev/null" ]