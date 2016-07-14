FROM php:7.0-alpine

RUN apk --update add patch && rm -rf /var/cache/apk/*

RUN pear install PHP_CodeSniffer-2.6.2
