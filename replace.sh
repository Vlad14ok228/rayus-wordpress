#!/bin/bash
docker exec -u www-data wordpress sh -c 'curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
docker exec -u www-data wordpress sh -c 'php wp-cli.phar search-replace "http://192.168.1.25" "https://rayus.igroman.online"'
echo "Done replacing URLs"
