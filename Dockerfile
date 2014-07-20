FROM ubuntu:14.04

# Install required system packages
RUN apt-get -q update
RUN apt-get install -yq git-core build-essential autoconf libtool gettext libgdiplus libgtk2.0-0 xsltproc

RUN git clone https://github.com/Serguzest/mono
WORKDIR /mono

RUN ./autogen.sh --prefix=/monoout --with-mcs-docs=no
RUN make get-monolite-latest
RUN make
RUN make install