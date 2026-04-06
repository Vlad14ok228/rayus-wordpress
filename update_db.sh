#!/bin/bash
docker exec -u www-data wordpress php wp-cli.phar search-replace "34-D, Greenville, NJ" "???. ????? ??????? 18?"
docker exec -u www-data wordpress php wp-cli.phar search-replace "+1 800 123 456" "+380(96)0981613"
echo "Done DB replacements."
