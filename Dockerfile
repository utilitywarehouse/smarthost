FROM alpine:3.12

COPY etc/postfix/main.cf /etc/postfix/main.cf
COPY postfix /

RUN apk add --no-cache \
      'postfix>3.4.0' \
      'postfix-pcre>3.4.0' \
      postfix-policyd-spf-perl \
      ca-certificates \
      cyrus-sasl \
      cyrus-sasl-plain \
      cyrus-sasl-login && \
  apk add ripgrep --repository http://dl-3.alpinelinux.org/alpine/edge/community && \
  touch /etc/aliases /etc/postfix/virtual_alias /etc/postfix/blacklisted_domains && \
  postmap /etc/postfix/virtual_alias && \
  postmap /etc/postfix/blacklisted_domains && \
  newaliases

EXPOSE 25

CMD ["/postfix"]
