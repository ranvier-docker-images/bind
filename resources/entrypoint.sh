#!/bin/bash

if [ "$1" == 'debug' ]; then
  apk add nano bash
  /bin/bash
  exit 0
fi

# Own cache directory
mkdir /var/cache/bind &&\
chown named:named /var/cache/bind &&\
chmod 775 /var/cache/bind

#if [ ! -e '/conf/configured.flag' ]; then
#  # Variable checks
#  [ -z ${FQDN} ] && printf '[ Fatal ] FQDN environment variable required. (e.g. FQDN=example.com)'; exit 1
#
#  # Generate DNSSEC key
#  KEY_RECORD=`dnssec-keygen -a HMAC-SHA -b 256 -n HOST $FQDN.`
#  KEY=`cut -d ' ' $KEY_RECORD 5`
#  sed "s|{{SECRET}}|$KEY|d" /app/templates/rndc.key.template > /conf/rndc.key
#
#fi

named -c /app/base.conf -u named -g

exit 0
