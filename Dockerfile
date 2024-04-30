FROM debian:bookworm-slim

RUN apt-get update && apt-get install curl -y

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]