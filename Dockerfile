FROM php:7.0-alpine

RUN apk add --no-cache patch

RUN pear install PHP_CodeSniffer-3.0.2
