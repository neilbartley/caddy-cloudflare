ARG RELEASE_VERSION

FROM caddy:${RELEASE_VERSION}-builder-alpine AS builder
ARG RELEASE_VERSION
RUN caddy-builder github.com/caddy-dns/cloudflare

FROM caddy:${RELEASE_VERSION}-alpine
ARG RELEASE_VERSION
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
