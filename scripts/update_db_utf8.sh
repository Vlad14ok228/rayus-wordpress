#!/bin/bash
docker exec -u www-data wordpress php wp-cli.phar search-replace "???. ????? ??????? 18?" "вул. Площа Свободи 18А"
docker exec -u www-data wordpress php wp-cli.phar search-replace "+380(96)0981613" "📞+380(96)0981613"
docker exec -u www-data wordpress php wp-cli.phar config set WP_DEBUG false --raw
docker exec -u www-data wordpress php wp-cli.phar config set WP_DEBUG_DISPLAY false --raw
docker exec -u www-data wordpress php wp-cli.phar config set WP_DEBUG_LOG false --raw
echo "Fix applied."