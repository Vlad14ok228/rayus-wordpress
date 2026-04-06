#!/bin/bash
docker exec wordpress sed -i 's/define( .WP_DEBUG., false );/define( "WP_DEBUG", true );\ndefine( "WP_DEBUG_LOG", true );\ndefine( "WP_DEBUG_DISPLAY", true );/' /var/www/html/wp-config.php
