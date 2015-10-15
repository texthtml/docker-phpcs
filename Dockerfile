FROM php:7.0

RUN apt-get update && apt-get -y install patch

RUN pear install PHP_CodeSniffer-2.3.4
