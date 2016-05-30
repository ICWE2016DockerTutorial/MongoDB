#!/bin/bash
set -e

## start Mongo just for the purpose of seeding data
mongod --fork --port 27018 --logpath /var/log/mongodb.log --dbpath /data/db

## load the seed data
mongorestore --port 27018 -d icwe2016dockertutorial /data/db/icwe2016dockertutorial

## stop Mongo
mongod --dbpath /data/db --shutdown

## execute the base image entrypoint in the context of the current shell
source /entrypoint.sh