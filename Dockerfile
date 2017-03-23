FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install git python python-dbus python-gobject python-pip

RUN git clone https://github.com/sintax1/scadasim.git

WORKDIR /scadasim

# TODO: Remove this once dbus branch is merged with master
RUN git checkout dbus

RUN make

VOLUME /var/run/dbus:/var/run/dbus

#ENTRYPOINT python /scadasim/scadasim/dbusservice/dbusservice.py

CMD make run
