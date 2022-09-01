FROM golang:1.18-bullseye as build
ARG PROTOC_VERSION=3.20.0
WORKDIR /opt

ADD . .
RUN mv protoc-gen-qcloudv3-go /go/bin
RUN cd pl_qcloudapi_v3/protoc-gen-qcloudapi/ && go install -buildvcs=false && cd ../ && rm -rf pl_qcloudapi_v3

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28.0; \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0; \
    go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@v2.10.0; \
    go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@v2.10.0; \
    go install github.com/go-swagger/go-swagger/cmd/swagger@v0.29.0; \
    go install github.com/envoyproxy/protoc-gen-validate@v0.6.2; \
    go install github.com/pseudomuto/protoc-gen-doc/cmd/protoc-gen-doc@v1.5.1; \
    go install github.com/googleapis/api-linter/cmd/api-linter@latest

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

RUN curl -sSLo /usr/local/bin/semver https://raw.githubusercontent.com/fsaintjacques/semver-tool/master/src/semver && chmod +x /usr/local/bin/semver

COPY --from=build /go/bin/ /go/bin/
COPY --from=build /opt/bin/protoc /usr/local/bin/
COPY --from=build /opt/include /usr/local/
RUN chmod +x /go/bin/protoc-gen-qcloudv3-go && ln -s /go/bin/protoc-gen-qcloudv3-go  /usr/bin/protoc-gen-qcloudv3-go 