FROM azul/zulu-openjdk-alpine:11

LABEL maintainer="hetikk"

ARG jarName=service1-0.0.1-SNAPSHOT.jar

WORKDIR /app

COPY service1/target/$jarName .

RUN chmod +x $jarName

EXPOSE 8001

CMD java -jar service1-0.0.1-SNAPSHOT.jar