FROM azul/zulu-openjdk-alpine:11

LABEL maintainer="hetikk"

ARG jarName=service2-0.0.1-SNAPSHOT.jar

WORKDIR /app

COPY service2/target/$jarName .

RUN chmod +x $jarName

EXPOSE 8002

CMD java -jar service2-0.0.1-SNAPSHOT.jar