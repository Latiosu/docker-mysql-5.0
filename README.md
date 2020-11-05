# Docker image for mysql 5.0 legacy projects
This docker image is intended to work as a replacement for old legacy projects, running on old server.

The entrypoint was partially taken from https://github.com/docker-library/mysql and easyfied/adapted.

## Run with Docker
Edit below command with desired data folder and credentials:
```
docker run \
--name mysql5 \
-p 3306:3306 \
--mount type=bind,source="$(pwd)/mydata",target=/mysql/data \
-e MYSQL_DATABASE="mydatabase" \
-e MYSQL_ROOT_HOST="%" \
-e MYSQL_ROOT_PASSWORD="root" \
-e MYSQL_USER="myuser" \
-e MYSQL_PASSWORD="mypassword" \
mysql:5.0
```

## Run with Docker Compose
Copy content of `docker-compose.yml` and edit to your needs. Also create a `.env` file if you want to supply custom UID/GID, ports and credentials.
```
docker-compose up
```
