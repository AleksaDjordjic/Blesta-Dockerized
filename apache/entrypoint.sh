#!/bin/bash

set -eo pipefail
shopt -s nullglob

# sendmail
echo "127.0.0.1 $(hostname).localdomain $(hostname)" >> /etc/hosts

# document root
echo "${APACHE_DOCUMENT_ROOT}"

if test "${APACHE_DOCUMENT_ROOT}" != ""; then
    sed -ri -e "s!/var/www/html!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/sites-available/*.conf
    sed -ri -e "s!/var/www/!${APACHE_DOCUMENT_ROOT}!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf
fi

if $IS_WORKER ; then 
    echo "Container is a worker container, not attempting to check if Blesta is present."
else
    echo "Checking if Blesta directory is present..."

    # download blesta if it doesn't exist
    if [ ! -d "/var/www/html/blesta" ]; then
        echo "Downloading Blesta..."
        wget "https://account.blesta.com/client/plugin/download_manager/client_main/download/${BLESTA_DOWNLOAD_ID}/blesta-${BLESTA_VERSION}.zip"
        unzip "blesta-${BLESTA_VERSION}.zip"
        rm -rd "blesta-${BLESTA_VERSION}.zip"

        # make sure all dirs exist
        mkdir -p /var/www/html/logs_blesta
    fi
fi

service sendmail restart
service apache2 restart

trap 'service apache2 stop; exit 0' TERM

while :
do
    sleep 1
done