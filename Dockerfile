FROM alpine:3.24@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

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
         /etc/postfix/virtual /etc/postfix/sender_canonical /etc/postfix/sender_access \
         /etc/postfix/header_checks /etc/postfix/second_header_checks \
      && postmap /etc/postfix/virtual_alias \
      && postmap /etc/postfix/blacklisted_domains \
      && postmap /etc/postfix/virtual \
      && newaliases

EXPOSE 25

CMD ["/postfix"]
