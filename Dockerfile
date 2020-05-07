FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends apt-utils build-essential sudo git cmake libssh-dev wget libssl-dev ca-certificates

RUN update-ca-certificates

WORKDIR /tmp

RUN wget https://github.com/rtrlib/rtrlib/archive/v0.7.0.tar.gz && tar -zxvf v0.7.0.tar.gz && rm v0.7.0.tar.gz

WORKDIR /tmp/rtrlib-0.7.0

RUN cmake -D CMAKE_BUILD_TYPE=Release .

RUN make 

RUN make install

WORKDIR /tmp

RUN wget https://github.com/rtrlib/bird-rtrlib-cli/archive/v0.1.1.tar.gz && tar -zxvf v0.1.1.tar.gz && rm v0.1.1.tar.gz

WORKDIR /tmp/bird-rtrlib-cli-0.1.1/

RUN cmake .

RUN make

VOLUME /var/run/bird.ctl 

CMD ./bird-rtrlib-cli -b /var/run/bird.ctl -r rtr.rpki.cloudflare.com:8282



