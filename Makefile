build:
	docker build -t postfix .
run:
	docker run --rm --name postfix\
	  -e "myhostname=$(MYHOSTNAME)" \
	  -e "mynetworks=$(MYNETWORKS)" \
	  -e "relayhost=$(RELAYHOST)" \
	  -e "smtp_sasl_password_maps=$(SMTP_SASL_PASSWORD_MAPS)" \
	  -e "myorigin=$(MYORIGIN)" \
	  -p 25:25 \
	  postfix
