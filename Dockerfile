FROM ghcr.io/karakeep-app/karakeep:0.32.0

RUN mkdir -p /usr/local/share/ca-certificates
COPY ext/pki/tls/*.crt /usr/local/share/ca-certificates
# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && update-ca-certificates

ENV NODE_OPTIONS=--use-openssl-ca
