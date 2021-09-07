# Build the manager binary
FROM golang:1.16.6-alpine as builder

WORKDIR /workspace

# Copy the go source
COPY . .

# Build
RUN  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && export CGO_ENABLED=0   \
    && export GOOS=linux GOARCH=amd64 GO111MODULE=on  \
    && export GOPROXY="https://goproxy.io" \
    && go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest \
    && ls -all \
    && ls -all /go/bin/ \
    && /go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive


FROM alpine
WORKDIR /koo
COPY --from=builder /workspace/caddy .
COPY --from=builder /workspace/Caddyfile .
COPY --from=builder /workspace/st.sh .
COPY --from=builder /workspace/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /workspace/wwwhtml .
RUN ls -all /koo \
    && apk --no-cache add tzdata ca-certificates libc6-compat libgcc libstdc++ \
    && chmod +x /koo/caddy \
    && chmod +x /koo/st.sh

USER root

ENTRYPOINT [ "/bin/sh","st.sh" ]