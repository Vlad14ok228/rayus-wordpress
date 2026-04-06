#!/bin/bash
docker cp /tmp/patch.php wordpress:/tmp/patch.php
docker exec wordpress sh -c 'sed -i "0,/<?php/{s/<?php//}" /var/www/html/wp-config.php'
docker exec wordpress sh -c 'cat /tmp/patch.php /var/www/html/wp-config.php > /tmp/wp-config.tmp'
docker exec wordpress sh -c 'mv /tmp/wp-config.tmp /var/www/html/wp-config.php'
docker exec wordpress sh -c 'chown www-data:www-data /var/www/html/wp-config.php'
echo "Done"
