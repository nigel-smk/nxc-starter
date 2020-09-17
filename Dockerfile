FROM ubuntu:xenial

# http://www.krizka.net/2009/12/27/starting-mindstorm-nxt-2-0-development-on-linux/
# https://sourceforge.net/p/bricxcc/code/HEAD/tree/

# install tools
RUN apt-get update
RUN apt-get -y install fpc libusb-dev subversion usbutils vim

# install nxt tools
RUN svn checkout svn://svn.code.sf.net/p/bricxcc/code/ bricxcc
RUN make -f /bricxcc/toolsunix64.mak
RUN chmod -R +x /bricxcc/x64
RUN cp /bricxcc/x64/* /usr/local/bin
RUN rm -rf /bricxcc

# setup usb
# maybe don't need the group in docker since we run as root?
# RUN addgroup legonxt
# RUN adduser root legonxt
# RUN mkdir /etc/udev/rules.d
# COPY setup/45-legonxt.rules /etc/udev/rules.d/
# COPY setup/legonxt.sh /etc/udev/
# RUN chmod +x /etc/udev/legonxt.sh

WORKDIR /home

ENTRYPOINT ["bash"]