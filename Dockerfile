FROM mongo:3.3.6

MAINTAINER Vincenzo FERME <info@vincenzoferme.it>

## copy the custom data and scripts
COPY data/seed/icwe2016dockertutorial /data/db/icwe2016dockertutorial
COPY bin/initialize-mongo.sh /initialize-mongo.sh
## add execution priviledges to initialize-mongo.sh
RUN chmod +x /initialize-mongo.sh

## ovveride the entrypoint, and consequently the command
ENTRYPOINT ["/initialize-mongo.sh"]

CMD ["mongod"]
