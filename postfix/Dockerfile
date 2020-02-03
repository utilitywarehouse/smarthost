#Dockerfile for a Postfix email relay service
FROM alpine:latest


RUN        true && \
           apk add 'postfix>3.4.0' && \
           apk add --no-cache --upgrade ca-certificates tcpdump cyrus-sasl bash cyrus-sasl-plain cyrus-sasl-login && \
           (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)
 


COPY etc/postfix/main.cf /etc/postfix/main.cf
COPY etc/resolv.conf /var/spool/postfix/etc/
COPY postconf.sh /bin/
RUN touch /etc/aliases  && touch /etc/postfix/virtual_alias && postmap /etc/postfix/virtual_alias && touch /etc/postfix/blacklisted_domains && postmap /etc/postfix/blacklisted_domains
RUN newaliases
RUN ln -s /dev/null /var/log/mail.log
ENTRYPOINT ["/bin/bash" , "postconf.sh"]
