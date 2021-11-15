FROM php:8-alpine

RUN apk add --no-cache patch

RUN pear install PHP_CodeSniffer-3.6.1
