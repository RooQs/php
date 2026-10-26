# rooqs/php 7.4.33

基于 `rooqs/php74-alpine:7.4.33-fpm-alpine3.16-cve2026-109618` 补全客户所需 PHP 扩展的 PHP 7.4.33 FPM 镜像（Alpine 3.16）。

## 镜像

- Docker Hub：`rooqs/php:7.4.33`
- GHCR：`ghcr.io/rooqs/php:7.4.33`
- 架构：`linux/amd64`、`linux/arm64`

## 已修复漏洞

基础镜像应用了 PHP2Shell 官方最小缓解补丁（commit `712e60f9`，"Avoid state corruption via bailout"），修复：

- GHSA-w8hw-w9fx-j79w（CVE-2026-109618）
- GHSA-6wmf-4rv5-p3rp（CVE-2026-109619）

注意：这是 EOL 版本（PHP 7.4）的最小缓解，不是完整升级。PHP 7.4 其他已知漏洞仍然存在。

## 本项目新增扩展（16 个）

| 扩展 | 安装方式 / 依赖 |
|---|---|
| bcmath | docker-php-ext-install |
| gd | --with-freetype --with-jpeg；freetype-dev、libjpeg-turbo-dev、libpng-dev |
| gettext | gettext-dev |
| imap | --with-kerberos --with-imap-ssl；imap-dev、krb5-dev、openssl-dev |
| mcrypt | PECL mcrypt-1.0.4；libmcrypt-dev |
| mysqli | docker-php-ext-install |
| opcache | docker-php-ext-enable |
| pcntl | docker-php-ext-install |
| pdo_mysql | docker-php-ext-install |
| pdo_pgsql | postgresql-dev |
| shmop | docker-php-ext-install |
| soap | libxml2-dev |
| sockets | docker-php-ext-install |
| sysvsem | docker-php-ext-install |
| xmlrpc | libxml2-dev（PHP 7.4 源码内置） |
| zip | libzip-dev |

## 基础镜像内置扩展

ctype, curl, date, dom, fileinfo, filter, ftp, hash, iconv, json, libxml, mbstring, mysqlnd, openssl, pcre, PDO, pdo_sqlite, Phar, posix, readline, Reflection, session, SimpleXML, sodium, SPL, sqlite3, standard, tokenizer, xml, xmlreader, xmlwriter, zlib

## 已知限制

- PHP 7.4 已 EOL，长期方案应升级到受支持的 PHP 版本。
- Alpine 3.16 已停止维护，需关注 apk 安全更新。
- mcrypt 已从 PHP 核心移除，仅为兼容旧应用保留。
