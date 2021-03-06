#!/bin/bash
file=/var/www/html/home.php
if [ -e "$file" ]; then
    echo "File does exist"
    exec /usr/local/bin/docker-php-entrypoint
else 
    git clone --progress https://github.com/eitea/T-Time.git /var/www/html/
    echo "DirectoryIndex home.php" > /var/www/html/.htaccess
    chown www-data:www-data  -R /var/www/html
    find /var/www/html -type d -exec chmod 755 {} \;
    find /var/www/html -type f -exec chmod 644 {} \;
    exec /usr/local/bin/docker-php-entrypoint
fi 

