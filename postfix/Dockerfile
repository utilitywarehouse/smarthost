#Dockerfile for a Postfix email relay service
FROM alpine:latest


RUN        true && \
           apk add 'postfix>3.4.0' && \
           apk add --no-cache --upgrade ca-certificates tcpdump openssl cyrus-sasl bash cyrus-sasl-plain cyrus-sasl-login && \
           (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)
 


COPY etc/postfix/main.cf /etc/postfix/main.cf
COPY etc/resolv.conf /var/spool/postfix/etc/
COPY postconf.sh /bin/
RUN touch /etc/aliases  && touch /etc/postfix/virtual_alias && postmap /etc/postfix/virtual_alias && touch /etc/postfix/blacklisted_domains && postmap /etc/postfix/blacklisted_domains
#RUN openssl req -newkey rsa:4096 -nodes -sha512 -x509 -days 3650 -nodes -out /etc/ssl/certs/mailserver.pem -keyout /etc/ssl/private/mailserver.key  -subj "/C=GB/ST=London/L=London/O=OrgName/OU=IT Department/CN=mailserver" && chown root.postfix /etc/ssl/certs/mailserver.pem /etc/ssl/private/mailserver.key
RUN newaliases

ENTRYPOINT ["/bin/bash" , "postconf.sh"]
