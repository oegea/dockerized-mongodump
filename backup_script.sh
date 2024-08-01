#!/bin/bash

MONGO_URI=${MONGO_URI:-"mongodb://localhost:27017"}
BACKUP_PATH=${BACKUP_PATH:-"/backup"}

mkdir -p $BACKUP_PATH

mongodump --uri=$MONGO_URI --out=$BACKUP_PATH

echo "Dump completed on $BACKUP_PATH"
