# vim: set ft=dockerfile :

FROM ubuntu:20.04
LABEL maintainer="Chris 'sh0shin' Frage"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
apt-get dist-upgrade -y && \
xargs apt-get install --no-install-recommends -y \
bash \
ca-certificates \
curl \
git \
gnupg \
jq \
python3-venv \
unzip \
xz-utils \
&& \
apt-get autoremove --purge -y && \
apt-get clean && \
rm -rf /var/cache/debconf/*-old /var/lib/apt/lists/* /var/log/*log /var/log/apt/*

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor > /etc/apt/trusted.gpg.d/hashicorp.gpg && \
. /etc/os-release && \
echo "deb https://apt.releases.hashicorp.com $VERSION_CODENAME main" > /etc/apt/sources.list.d/terraform.list && \
apt-get update && apt-get install --no-install-recommends -y terraform && \
apt-get clean && \
rm -rf /var/cache/debconf/*-old /var/lib/apt/lists/* /var/log/*log /var/log/apt/*

COPY . /xbin/duct-bash
