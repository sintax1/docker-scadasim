FROM ubuntu:latest

RUN apt-get update && \
    apt-get -y install git python python-dbus python-gobject python-pip

RUN git clone https://github.com/sintax1/scadasim.git

WORKDIR /scadasim

RUN make

VOLUME /var/run/dbus

COPY scadasim_config.yml scadasim_config.yml

ENTRYPOINT python -i run.py -c scadasim_config.yml -d

#CMD python -i run.py -c scadasim_config.yml -d

