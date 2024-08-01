#!/bin/bash

MONGO_URI=${MONGO_URI:-"mongodb://localhost:27017"}
BACKUP_PATH=${BACKUP_PATH:-"/backup"}
DB_NAME=${DB_NAME:-"mydatabase"}

mkdir -p $BACKUP_PATH

mongodump --uri=$MONGO_URI --out=$BACKUP_PATH

echo "Dump completed on $BACKUP_PATH"
