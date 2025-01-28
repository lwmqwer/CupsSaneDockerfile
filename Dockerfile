FROM ubuntu:22.04
#COPY sources.list /etc/apt/sources.list
COPY epson-inkjet-printer-201401w_1.0.1-1_amd64.deb /epson-inkjet-printer-201401w_1.0.1-1_amd64.deb

RUN apt-get update && apt install -y software-properties-common && add-apt-repository ppa:sane-project/sane-release && \
    apt-get install -y cups libcupsimage2 sane sane-utils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && dpkg -i /epson-inkjet-printer-201401w_1.0.1-1_amd64.deb && \
    rm /epson-inkjet-printer-201401w_1.0.1-1_amd64.deb && sed -i '21 a usb 0x04b8 0x08d1' /etc/sane.d/epson2.conf
RUN echo "root:root" | chpasswd
COPY cupsd.conf /etc/cups/cupsd.conf
CMD ["/usr/sbin/cupsd", "-f"]
