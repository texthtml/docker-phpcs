# PHPCS

This is a docker image for [PHP_CodeSniffer](https://github.com/PHPCSStandards/PHP_CodeSniffer)

## Usage

Detect code standard violations

```
docker run -v /path/to/php/files/:/scripts/ texthtml/phpcs phpcs --standard=PSR2 /scripts/
```

and fix them

```
docker run -v /path/to/php/files/:/scripts/ texthtml/phpcs phpcbf --standard=PSR2 /scripts/
```
