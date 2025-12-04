FROM ghcr.io/karakeep-app/karakeep:0.29.1

COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN apk --no-cache add ca-certificates && update-ca-certificates

ENV NODE_OPTIONS=--use-openssl-ca
