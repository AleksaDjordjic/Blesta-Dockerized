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

1. Go to [Blesta download page](https://account.blesta.com/client/plugin/download_manager/client_main/) and pick a version to install, note the link `.../download/{id}/blesta-{version}.zip`, edit the `docker-compose.yml` with the {id} and {version} you need.
2. `docker-compose up -d`

## Setup
1. Go to [localhost:8081](http://localhost:8081)
    * Login with:
        - Server: mysql
        - Username: root
        - Password: root
2. Create a database, name it something that you can remember like `blesta`
3. Go to [localhost:8080/blesta](http://localhost:8080/blesta)
4. Install Blesta
    * Database Information:
        - Host: mysql
        - Port: 3306
        - Database Name: Specified in step #2, `blesta`
        - User: root
        - Password: root
5. Enter your licence key and create an admin account 

## After Setup
You should by now have a working Blesta instance, but in System Status you might notice "Cron has never run. Configure?". Don't worry about this, wait at most 5 minutes and let the cron run, this will disappear.