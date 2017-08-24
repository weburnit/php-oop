CREATE USER evently_user WITH PASSWORD 'evently_pass';
CREATE DATABASE evently_db;
CREATE DATABASE evently_db_test;
GRANT ALL PRIVILEGES ON DATABASE evently_db TO evently_user;
GRANT ALL PRIVILEGES ON DATABASE evently_db_test TO evently_user;