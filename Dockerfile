FROM debian:stable-slim@sha256:435ba09b2e259426c0552a041eef609b01d4655d9c8467d75be390801068baf3

RUN apt-get update && \ 
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
        default-jre=2:1.17-74 \
        less=590-2 \
        curl=7.88.1-10+deb12u5 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fLo /usr/local/bin/trino https://repo1.maven.org/maven2/io/trino/trino-cli/439/trino-cli-439-executable.jar && \
    chmod 755 /usr/local/bin/trino

ENV TRINO_HOST http://trino:8080
ENV CATALOG kafka
ENV SCHEMA steadforce
ENV QUERY_SLEEP_TIME 1

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 755 /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]