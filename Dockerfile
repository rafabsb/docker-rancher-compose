# Set base image.
FROM alpine:latest

MAINTAINER Dominik Hahn <dominik@monostream.com>

# Define rancher-compose version
ENV RANCHER_COMPOSE_VERSION=v0.12.3

# Install dependencies and rancher-compose
RUN apk add --quiet --no-cache ca-certificates curl unzip && \
	curl -sSL "https://github.com/rancher/rancher-compose/releases/download/${RANCHER_COMPOSE_VERSION}/rancher-compose-linux-amd64-${RANCHER_COMPOSE_VERSION}.tar.gz" | tar -xzp -C /usr/local/bin/ --strip-components=2 && \
	rm -rf /var/cache/*

# Set working directory
WORKDIR /workspace

# Copy upgrade script
COPY ["upgrade.sh", "./"]

# Executing defaults
CMD ["/bin/sh"]