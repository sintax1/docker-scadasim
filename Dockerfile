FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install git python python-dbus python-gobject

RUN git clone https://github.com/sintax1/scadasim.git

WORKDIR /scadasim

RUN git checkout dbus

VOLUME /var/run/dbus:/var/run/dbus

ENTRYPOINT python /scadasim/scadasim/dbusservice/dbusservice.py
