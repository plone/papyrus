#
# Dockerfile for Caddy https://caddyserver.com/
# Addopted from https://github.com/abiosoft/caddy-docker
#

FROM alpine:3.4
MAINTAINER Sven Strack <sven@so36.net>

LABEL caddy_version="0.9.3" architecture="amd64" plone_version="5.1"

RUN builddeps=' \
	tar \
	curl \
	'\
	&& apk --no-cache add \
	$builddeps \
	git \
	openssh-client \
	&& curl --silent --show-error --fail --location \
		--header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
		"https://caddyserver.com/download/build?os=linux&arch=amd64&features=git" \
    	| tar --no-same-owner -C /usr/bin/ -xz caddy \
 	&& chmod 0755 /usr/bin/caddy \
 	&& /usr/bin/caddy -version \
 	&& apk del --purge $builddeps

EXPOSE 2015
WORKDIR /srv

ADD dockerfiles/Caddyfile /etc/Caddyfile
ADD build/html/en /srv/html

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]

