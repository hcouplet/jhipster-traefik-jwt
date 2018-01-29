#!/bin/bash

#jhipster --skip-server --with-entities --skip-user-management --auth=jwt --db=mariadb

HOME_DIR="$(pwd)"
cd "$HOME_DIR"/app; jhipster
cd "$HOME_DIR"/gateway-uaa; jhipster

cd "$HOME_DIR"/app; jhipster  entity testEntity --force
cd "$HOME_DIR"/gateway-uaa; jhipster  entity testEntity --force

cd "$HOME_DIR"/app; ./mvnw verify -Pprod dockerfile:build
cd "$HOME_DIR"/gateway-uaa; ./mvnw verify -Pprod -DskipTests dockerfile:build

