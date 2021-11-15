FROM php:8.0-alpine

RUN apk add --no-cache patch

RUN pear install PHP_CodeSniffer-3.6.1
