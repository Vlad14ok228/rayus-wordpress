# RAYUS Hotel — WordPress Website

**Live site:** [rayus.igroman.online](https://rayus.igroman.online)

A fully customized WordPress website for **RAYUS** — a modern hotel, restaurant and beauty salon complex located near the Ukrainian border.

---

## Tech Stack

![WordPress](https://img.shields.io/badge/WordPress-21759B?style=for-the-badge&logo=wordpress&logoColor=white)
![PHP](https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Cloudflare](https://img.shields.io/badge/Cloudflare-F38020?style=for-the-badge&logo=cloudflare&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

---

## What Was Done

### Infrastructure
- Deployed WordPress on a **home server via Docker**
- Configured **Cloudflare** as a reverse proxy with HTTPS (Flexible SSL)
- Fixed Mixed Content issues by patching `wp-config.php` to detect `HTTP_X_FORWARDED_PROTO`
- Migrated all URLs from local IP (`http://192.168.1.25`) to public domain via **WP-CLI**

### Design & Customization
- Developed **MU (Must-Use) plugins** in PHP for custom styles injected site-wide:
  - Custom button color and styling
  - Gallery image normalization (`aspect-ratio: 4/3`, `object-fit: cover`)
  - Instagram link injection via JavaScript
- Removed white backgrounds from logo images using **Python (Pillow)**
- Fixed Astra theme **Retina (2x) logo** to ensure correct display on mobile/HiDPI screens
- Translated full navigation menu and all UI text to Ukrainian via WP-CLI

### Database Management (WP-CLI over SSH + Docker)
- Bulk search-replace of URLs, addresses, phone numbers and UI text in the database
- Translated all amenity labels and service names to Ukrainian
- Updated contact info in footer (address, phone number with emoji)
- Replaced placeholder icons with modern **Tabler Icons** (SVG → PNG conversion via `rsvg-convert`)

### Debugging
- Diagnosed and resolved **White Screen of Death** in wp-admin (UTF-8 BOM encoding issue)
- Toggled `WP_DEBUG` on/off via WP-CLI scripts for safe debugging in production
- Investigated and fixed **Cloudflare caching** issues causing stale content on mobile devices
- Identified Astra theme's separate Retina logo cache as root cause of mobile display inconsistency

---

## Project Structure

```
├── custom-styles.php        # MU plugin: button, gallery, Instagram link
├── custom-button.php        # MU plugin: button color override
├── patch.php                # wp-config.php patch for Cloudflare SSL
├── patch.sh                 # Applies patch.php to server via Docker
├── replace.sh               # URL migration: local IP → public domain
├── change_db.sh             # Translates CTA button text to Ukrainian
├── translate_amenities.sh   # Translates amenity names to Ukrainian
├── update_db.sh             # Updates footer address and phone
├── update_db_utf8.sh        # UTF-8 fix + debug mode toggle
├── enable_debug.sh          # Enables WP_DEBUG via WP-CLI
├── debug.sh                 # Enables WP_DEBUG via sed
├── get_color.py             # Extracts dominant color from logo image
└── rayus_final_logo_nobg.png # Logo with transparent background
```

---

## Key Challenges Solved

| Problem | Solution |
|---------|----------|
| Site broken on public domain (HTTPS) | Patched `wp-config.php` for Cloudflare Flexible SSL |
| White Screen of Death in wp-admin | Found and fixed UTF-8 BOM encoding in PHP file |
| Logo not updating on mobile | Discovered Astra theme stores separate Retina (2x) logo in `astra-settings` |
| Cloudflare serving stale content | Used Cache Purge + identified `srcset` 1x/2x as root cause |
| Cyrillic encoding broken in DB | Used proper UTF-8 WP-CLI search-replace |

---

## Server Setup

- **Server:** Home server at local network, accessed via SSH
- **Stack:** Docker + WordPress + MariaDB containers
- **Proxy:** Cloudflare (Free plan) → Home server port 80
- **SSL:** Cloudflare Flexible SSL with custom `wp-config.php` patch
