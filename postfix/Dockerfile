#Dockerfile for a Postfix email relay service
#FROM debian:bullseye
FROM alpine:latest

#ENV DEBIAN_FRONTEND="noninteractive"

#RUN apt-get update && apt-get upgrade -y
#RUN apt-get install -y postfix mailutils procps iputils-ping

RUN        true && \
           apk add 'postfix>3.4.0' && \
           apk add --no-cache --upgrade ca-certificates cyrus-sasl bash cyrus-sasl-plain cyrus-sasl-login && \
           (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)
 


COPY etc/postfix/main.cf /etc/postfix/main.cf
COPY etc/resolv.conf /var/spool/postfix/etc/
COPY postconf.sh /bin/
RUN touch /etc/aliases  && touch /etc/postfix/virtual_alias && postmap /etc/postfix/virtual_alias && touch /etc/postfix/blacklisted_domains && postmap /etc/postfix/blacklisted_domains
RUN newaliases

ENTRYPOINT ["/bin/bash" , "postconf.sh"]
