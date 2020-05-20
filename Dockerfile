FROM alpine:3.11.6

RUN apk add --update curl jq bash

# install kubectl
ENV KUBECTL_VERSION=1.15.3

RUN curl -vo /usr/local/bin/kubectl http://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x /usr/local/bin/kubectl

# copy collector to container
COPY src/reap.sh ./
RUN chmod +x reap.sh

CMD ./reap.sh
