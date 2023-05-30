#!/bin/bash

docker run -d \
    -v ./data-extraction-suite:/usr/local/onfhir-feast/conf \
    -v ./feast-logs:/usr/local/onfhir-feast/logs \
    -v ./extracted-datasets:/usr/local/onfhir-feast/datasets \
    -v ./extracted-data-catalog:/usr/local/onfhir-feast/data-catalog \
    --network=aic_net \
    --env APP_CONF_FILE=/usr/local/onfhir-feast/conf/docker/onfhir-feast.conf \
    --env LOG4J_CONF_FILE=/usr/local/onfhir-feast/conf/docker/log4j2.xml \
    --env KAFKA_SERVER_0=kafka-1:29092 \
    --env FHIR_REPO_URL=http://onfhir:8080/fhir \
    --env DEFINITIONS_FOLDER=/usr/local/onfhir-feast/conf/definitions/pilot2 \
    --env DB_HOST=timescaledb \
    --env DB_USER=onfhir_feast \
    --env DB_PASSWORD=onfhir_feast \
    --name onfhir-feast srdc/onfhir-feast:latest \
    extract-dataset --pipeline https://aiccelerate.eu/feature-sets/pilot2_dataset
