FROM openjdk:11

LABEL maintainer="hetikk"

RUN mkdir -p /usr/local/opt/docker

COPY target/docker-0.0.1-SNAPSHOT.jar /usr/local/opt/docker

RUN chmod +x /usr/local/opt/docker/docker-0.0.1-SNAPSHOT.jar

# => -p 1234:1234
#EXPOSE 1234

CMD java -jar /usr/local/opt/docker/docker-0.0.1-SNAPSHOT.jar