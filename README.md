# rooqs/php

基于 `rooqs/php74-alpine:7.4.33-fpm-alpine3.16-cve2026-109618` 补全 PHP 扩展的镜像。

## 扩展

bcmath, gd, gettext, imap, mcrypt, mysqli, opcache, pcntl, pdo_mysql, pdo_pgsql, shmop, soap, sockets, sysvsem, xmlrpc, zip

## 构建

推送到 `main` 分支或手动触发 `build-php74-ext-image` 工作流，镜像推送到 `ghcr.io/rooqs/php74-alpine-ext`。
