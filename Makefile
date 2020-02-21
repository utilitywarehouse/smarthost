build:
	docker build -t postfix .
run:
	docker run -ti --rm --name postfix \
	  -e "MYHOSTNAME=$(MYHOSTNAME)" \
	  -e "MYNETWORKS=$(MYNETWORKS)" \
	  -e "RELAYHOST=$(RELAYHOST)" \
	  -e "SMTP_SASL_PASSWORD_MAPS=$(SMTP_SASL_PASSWORD_MAPS)" \
	  -e "MYORIGIN=$(MYORIGIN)" \
	  -p 25:25 \
	  postfix
