# Simple Dockerized version of Postfix

[![Docker Repository on Quay](https://quay.io/repository/utilitywarehouse/smarthost/status "Docker Repository on Quay")](https://quay.io/repository/utilitywarehouse/smarthost)

Minimalist version of postfix to work primarily as relayhost using SASL auth.
It is using Alpine latest and Postfix>3.4

## Arguments

- `SMTP_SASL_PASSWORD_MAPS` - The Key used to to authenticate to the relayhost
- `MYHOSTNAME` - The hostname that will be used by Postfix on SMTP handshake
- `MYORIGIN` - Domain used to send emails
- `MYNETWORKS` - Network allowed to send emails using this docker
- `RELAYHOST` - Relayhost Server
- `DEBUG_PEER_LIST` - If you need to debug e-mails for a specific domain, you
  can run the container using this parameter. Ex: `DEBUG_PEER_LIST = google.com`
  or `DEBUG_PEER_LIST = google.com, 64.233.167.26`
- `LOG_FILTER_REGEX` - (string) regex to filter out noisy logs
- `CANONICAL_PATTERN` - (string) pattern to map addresses (for example Gmail
  style dot removal)
- `TLS_CERT_PATH` - (string) if using TLS to receive emails, path to
  certificate file
- `TLS_KEY_PATH` - (string) if using TLS to receive emails, path to
  key file

## Running

```
export MYHOSTNAME="emails.utilitywarehouse.co.uk"
export MYORIGIN="utilitywarehouse.co.uk"
export MYNETWORKS="127.0.0.0/8 10.0.0.0/8 172.16.0.0/12"
export RELAYHOST="[email-smtp.eu-west-1.amazonaws.com]:587"
export SMTP_SASL_PASSWORD_MAPS="AKIAIOSFODNN7EXAMPLE:wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
export CANONICAL_PATTERN="/^(.*)\.(.*)@((.*\.)*UW\.PARTNERS)$/ ${1}${2}@${3}"

make run
```

## Log filtering

Postfix doesn't provide a nice OOB solution for controlling logs. Running
behind a load-balancer produces a lot of noise in form of "connect /
disconnect" logs. You can filter these by exporting the following filter
string:

```
export LOG_FILTER_REGEX="(lost connection after |(dis)?connect from )"
```

Postfix version needs to be > 3.4 (from that version the logging at /dev/stdout
is supported)

Bonus: bash_smtp_test to test the deployment. It is a very simple bash script
to test the SMTPD and relayhost.
