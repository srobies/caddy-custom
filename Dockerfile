FROM caddy:2.10.0-builder AS builder

RUN xcaddy build \
        --with github.com/caddy-dns/porkbun \
        --with github.com/hslatman/caddy-crowdsec-bouncer/http \
        --with github.com/mholt/caddy-dynamicdns \
        --with github.com/porech/caddy-maxmind-geolocation

FROM caddy:2.10.0

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
