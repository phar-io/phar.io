#!/bin/bash

set -e

echo "Start PHP image"

# Define of php path
PHP_FPM=$(which php-fpm)

${PHP_FPM} --nodaemonize
