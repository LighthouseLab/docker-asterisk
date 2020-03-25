FROM alpine:3.11.3

MAINTAINER Lighthouse Labs <lighthouselabs@github.com>

RUN apk add --update \
      asterisk \
      asterisk-sample-config

RUN rm -rf /var/run/asterisk/* \
    && mkdir -p /var/spool/asterisk/fax \
    && chown -R asterisk: /var/spool/asterisk/fax \
    && truncate -s 0 /var/log/asterisk/messages \
                     /var/log/asterisk/queue_log \
    &&  rm -rf /var/cache/apk/* \
               /tmp/* \
               /var/tmp/*

EXPOSE 5060/udp
VOLUME /var/lib/asterisk/sounds /var/lib/asterisk/keys /var/lib/asterisk/phoneprov /var/spool/asterisk /var/log/asterisk

ENTRYPOINT ["/usr/sbin/asterisk", "-fvvvddd"]
