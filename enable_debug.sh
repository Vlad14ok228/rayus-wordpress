#!/bin/bash
docker exec -u www-data wordpress sh -c 'curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
docker exec -u www-data wordpress sh -c 'php wp-cli.phar config set WP_DEBUG true --raw'
docker exec -u www-data wordpress sh -c 'php wp-cli.phar config set WP_DEBUG_LOG true --raw'
docker exec -u www-data wordpress sh -c 'php wp-cli.phar config set WP_DEBUG_DISPLAY true --raw'
echo "Debug enabled"
