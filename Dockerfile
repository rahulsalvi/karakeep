FROM ghcr.io/karakeep-app/karakeep:0.31.0

RUN mkdir -p /usr/local/share/ca-certificates
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
RUN apt-get update \
  && apt-get install -y ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && update-ca-certificates

ENV NODE_OPTIONS=--use-openssl-ca
