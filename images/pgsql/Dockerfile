FROM postgres:9.5

ADD create_databases.sql /docker-entrypoint-initdb.d/create_databases.sql

RUN apt-get update -y && apt-get install pgloader -y