FROM php:8.5-alpine AS base

FROM base AS builder

RUN curl -OL https://phar.io/releases/phive.phar && \
    curl -OL https://phar.io/releases/phive.phar.asc && \
    apk add --no-cache --virtual .gpg gpg gpg-agent && \
    gpg --keyserver hkps://keys.openpgp.org --recv-keys 0x9D8A98B29B2D5D79 && \
    gpg --verify phive.phar.asc phive.phar && \
    chmod +x phive.phar

ARG VERSION

RUN ./phive.phar install --trust-gpg-keys D91D86963AF3A29B6520462297B02DD8E5071466 phpcs@$VERSION
RUN ./phive.phar install --trust-gpg-keys D91D86963AF3A29B6520462297B02DD8E5071466 phpcbf@$VERSION

RUN /tools/phpcs --version
RUN /tools/phpcbf --version

FROM base

COPY --from=builder /tools/phpcs /usr/bin/phpcs
COPY --from=builder /tools/phpcbf /usr/bin/phpcbf