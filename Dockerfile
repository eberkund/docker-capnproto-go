FROM golang:alpine
RUN \
  apk update && apk add git make build-base openssl curl file autoconf automake libtool linux-headers && \
  cd /root && \
  git clone https://github.com/sandstorm-io/capnproto.git && \
  cd capnproto && \
  cd c++ && \
  autoreconf -i && \
  ./configure && \
  make -j6 check && \
  make install && \
  cd .. && \
  go get -u -t github.com/glycerine/go-capnproto && \
  cd $GOPATH/src/github.com/glycerine/go-capnproto && \
  make && \
  go test
