FROM php:7.0-alpine

RUN apk add --no-cache patch

RUN pear install PHP_CodeSniffer-2.9.1
