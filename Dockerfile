FROM php:8.3-alpine

RUN apk add --no-cache patch

RUN pear install PHP_CodeSniffer-3.7.2
