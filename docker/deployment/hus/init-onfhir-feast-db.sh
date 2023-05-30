#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER onfhir_feast WITH ENCRYPTED PASSWORD 'onfhir_feast';
	CREATE DATABASE onfhir_feast;
	GRANT ALL PRIVILEGES ON DATABASE onfhir_feast TO onfhir_feast;
EOSQL