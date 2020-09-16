FROM ubuntu:xenial

# http://www.krizka.net/2009/12/27/starting-mindstorm-nxt-2-0-development-on-linux/
# https://sourceforge.net/p/bricxcc/code/HEAD/tree/

RUN apt-get update

RUN apt-get -y install fpc libusb-dev subversion
RUN svn checkout svn://svn.code.sf.net/p/bricxcc/code/ bricxcc
RUN make -f /bricxcc/toolsunix64.mak
RUN chmod -R +x /bricxcc/x64
RUN cp /bricxcc/x64/* /usr/local/bin
RUN rm -rf /bricxcc

ENTRYPOINT ["sh"]