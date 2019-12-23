## Simple Dockerized version of Posffix for relayhost


1.  Minimalist version of postfix to work primarily as relayhost using SASL auth. It is using Alpine latest and Postfix>3.4

2. Building the container: 

`docker build -t postfix postfix/.`

3. The following arguments can be overridden during the startup:


`smtp_sasl_password_maps` -->
The Key used to to authenticate to the relayhost

`myhostname` -->
The hostname that will be used by Postfix on SMTP handshake

`myorigin`-->
Domain used to send emails

`mynetwork` -->
Network allowed to send emails using this docker

`relayhost` --> 
Relayhost Server

`debug_peer_list`  -->
If you need to debug e-mails for a specific domain, you can run the container using this parameter. Ex:
`debug_peer_list = google.com`
or
`debug_peer_list = google.com, 64.233.167.26`


4. Running it :

```
docker run -d --rm --name postfix -e "myhostname=emails.utilitywarehouse.co.uk" -e "mynetworks=127.0.0.0/8 10.0.0.0/8 172.16.0.0/12" -e "relayhost=[email-smtp.eu-west-1.amazonaws.com]:587" -e "smtp_sasl_password_maps=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" -e "myorigin=utilitywarehouse.co.uk" -p25:25 postfix 
```

5. Posffix version need to be > 3.4 ( from that version the logging at /dev/stdout is supported)

6. Bonus: bash_smtp_test to test the deployment. It is a very simple bash script to test the SMTPD and relayhost.
 
