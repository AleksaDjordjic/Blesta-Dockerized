# Blesta Dockerized #

Blesta inside of Docker containers intended for development use, not recommended in production!

## Requirements
* Linux
    * [Docker](https://docs.docker.com/engine/install/)
    * [Docker Compose](https://docs.docker.com/compose/install/)
* Windows
    * [Docker Desktop](https://www.docker.com/products/docker-desktop)
* MacOS
    * [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Installation

1. Download and extract `blesta-{version}.zip` inside of `/src`
2. `docker-compose up -d`

## Setup
1. Go to [localhost:8081](http://localhost:8081)
    * Login with:
        - Server: mysql
        - Username: root
        - Password: root
2. Create a database, name it something that you can remember like `blesta`
3. Go to [localhost:8080](http://localhost:8080)
4. Install Blesta
    * Database Information:
        - Host: mysql
        - Port: 3306
        - Database Name: Specified in step #2, `blesta`
        - User: root
        - Password: root
5. Enter your licence key and create an admin account 

## After Setup
You should by now have a working Blesta instance, but in System Status you might notice 2 things:
1. "Cron has never run. Configure?" - Don't worry about this, wait at most 5 minutes and let the cron run, this will disappear.
2. "A system directory is not writeable. Update?" - This needs to get updated.
    - Inside of `/src` create a folder named `logs_blesta`
    - Click on ["Update?"](http://localhost:8080/blesta/admin/settings/system/general/basic/)
    - Change `Uploads Directory` to `/var/www/html/uploads/`
    - Change `Log Directory` to `/var/www/html/logs_blesta/`
    - Update Settings