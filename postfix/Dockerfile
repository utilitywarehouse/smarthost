FROM alpine:3.11

COPY etc/postfix/main.cf /etc/postfix/main.cf
COPY etc/resolv.conf /var/spool/postfix/etc/
COPY etc/rsyslog/rsyslog.conf /etc/rsyslog.conf
COPY etc/supervisord.conf /etc/supervisord.conf
COPY postfix /bin/

RUN apk add --no-cache 'postfix>3.4.0' ca-certificates cyrus-sasl cyrus-sasl-plain cyrus-sasl-login rsyslog supervisor && \
  touch /etc/aliases /etc/postfix/virtual_alias /etc/postfix/blacklisted_domains && \
  postmap /etc/postfix/virtual_alias && \
  postmap /etc/postfix/blacklisted_domains && \
  newaliases

EXPOSE 25

CMD ["supervisord"]
