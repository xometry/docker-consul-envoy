# match consul-helm
FROM envoyproxy/envoy-alpine:v1.10.0

RUN apk add -u bash curl &&\
    wget https://releases.hashicorp.com/consul/1.6.3/consul_1.6.3_linux_amd64.zip -O /tmp/consul.zip &&\
    unzip /tmp/consul.zip -d /tmp &&\
    mv /tmp/consul /usr/local/bin/consul

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
