FROM php:8.6-alpine AS base

FROM base AS builder

RUN apk add --no-cache --virtual .mbdeps $PHPIZE_DEPS oniguruma-dev && docker-php-ext-install mbstring

RUN curl -OL https://phar.io/releases/phive.phar && \
    curl -OL https://phar.io/releases/phive.phar.asc && \
    apk add --no-cache --virtual .gpg gpg gpg-agent && \
    gpg --keyserver hkps://keys.openpgp.org --recv-keys 0x9D8A98B29B2D5D79 && \
    gpg --verify phive.phar.asc phive.phar && \
    chmod +x phive.phar

ARG VERSION

RUN ./phive.phar install --trust-gpg-keys 5CB4F778BF9BC4FB67AE511D96E91A992CF22FF4 phpcs@$VERSION
RUN ./phive.phar install --trust-gpg-keys 5CB4F778BF9BC4FB67AE511D96E91A992CF22FF4 phpcbf@$VERSION

RUN /tools/phpcs --version
RUN /tools/phpcbf --version

FROM base

COPY --from=builder /tools/phpcs /usr/bin/phpcs
COPY --from=builder /tools/phpcbf /usr/bin/phpcbf