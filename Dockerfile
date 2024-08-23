FROM alpine:3.20

COPY etc/postfix/main.cf /etc/postfix/main.cf
COPY postfix /

RUN apk add --no-cache \
      'postfix-pcre>3.4.0' \
      'postfix>3.4.0' \
      ca-certificates \
      cyrus-sasl \
      postfix-policyd-spf-perl \
      ripgrep \
      && touch /etc/aliases /etc/postfix/virtual_alias /etc/postfix/blacklisted_domains \
      && postmap /etc/postfix/virtual_alias \
      && postmap /etc/postfix/blacklisted_domains \
      && newaliases

EXPOSE 25

CMD ["/postfix"]
