<?php
/*
Plugin Name: Custom Button Color
Description: Скрипт для зміни кольору кнопки "Make An Enquiry" на червоний
*/
add_action('wp_head', function() {
    echo '<style>
    .uagb-block-cd43bc79 .uagb-infobox-cta-link.wp-block-button__link {
        background-color: red !important;
        border-color: red !important;
        color: white !important;
    }
    .uagb-block-cd43bc79 .uagb-infobox-cta-link.wp-block-button__link svg {
        fill: white !important;
    }
    </style>';
});
