ARG CADDY_VERSION

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder
ARG CADDY_VERSION
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:${CADDY_VERSION}-alpine
ARG CADDY_VERSION
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
