FROM alpine:latest AS downloader

# https://github.com/semicons/java_oci_manage/releases/latest/download/gz_client_bot.tar.gz
ARG VERSION=4.9.8

WORKDIR /app

RUN set -ex; \
    apk add wget && \
    wget https://github.com/semicons/java_oci_manage/releases/download/v${VERSION}/gz_client_bot.tar.gz && \
    tar -zxvf gz_client_bot.tar.gz && \
    rm -rf gz_client_bot.tar.gz

FROM openjdk:17-slim

COPY --from=downloader /app /app

ENV SERVER_PORT=${SERVER_PORT:-9527}

WORKDIR /app

CMD java -Dfile.encoding=utf-8 -jar -Dserver.port=$SERVER_PORT r_client.jar --configPath=client_config

EXPOSE 9527
