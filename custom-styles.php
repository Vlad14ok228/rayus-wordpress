<?php
/* Plugin Name: Custom Styles Description: ???????? CSS ????? ?? ??????? ??? ????? (??????, ???????, ?????????) */
add_action('wp_head', function () {
    echo '<style>
    /* Button Customization */
    .uagb-block-cd43bc79 .uagb-infobox-cta-link.wp-block-button__link {
        background-color: #fca000 !important;
        border-color: #fca000 !important;
        color: white !important;
    }
    .uagb-block-cd43bc79 .uagb-infobox-cta-link.wp-block-button__link svg {
        fill: white !important;
    }
    
    /* Gallery Customization */
    .spectra-image-gallery__media-wrapper img,
    .spectra-image-gallery__media-thumbnail {
        aspect-ratio: 4 / 3 !important;
        object-fit: cover !important;
        width: 100% !important;
        height: auto !important;
    }
    </style>';
});

add_action('wp_footer', function () {
    echo '<script>
    document.addEventListener("DOMContentLoaded", function() {
        var socialLinks = document.querySelectorAll(".ast-instagram");
        socialLinks.forEach(function(link) {
            link.href = "https://www.instagram.com/rayus_complex/";
        });
    });
    </script>';
});
