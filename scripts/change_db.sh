#!/bin/bash
docker exec -u www-data wordpress bash -c 'curl -sO https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar'
docker exec -u www-data wordpress bash -c 'php wp-cli.phar search-replace "Make An Enquiry" "Забронювати" --all-tables'
docker exec -u www-data wordpress bash -c 'php wp-cli.phar search-replace "MAKE AN ENQUIRY" "ЗАБРОНЮВАТИ" --all-tables'
docker exec -u www-data wordpress bash -c 'php wp-cli.phar search-replace "make an enquiry" "забронювати" --all-tables'
echo "Database update completed."
