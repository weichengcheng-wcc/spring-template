FROM jdk:1.8

MAINTAINER C.W

COPY ./target/app.jar /apps/instances/app.jar
COPY ./src/sh/start.sh /apps/instances/start.sh

ENTRYPOINT ["/bin/bash", "/apps/instances/start.sh"]