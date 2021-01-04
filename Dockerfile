FROM python:3-buster AS build

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y full-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        sudo \
        build-essential \
        libssl-dev \
        libffi-dev \
        libpcap-dev \
        python3-dev \
        python3-virtualenv && \
    mkdir -p /opt && \
    git clone https://github.com/thinkst/opencanary /opt/opencanary && \
    cd /opt/opencanary && \
    python3 -m venv . && \
    . bin/activate && \
    python setup.py sdist && \
    cd dist && \
    pip install -U pip && \
    pip install setuptools==45 wheel && \
    pip install scapy pcapy rdpy && \
    pip install opencanary-*.tar.gz

FROM python:3-buster

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y full-upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        sudo \
        iptables \
        python3-virtualenv && \
    mkdir -p /opt /etc/opencanaryd && \
    adduser --disabled-password --home /opt/opencanary --shell /usr/sbin/nologin --gecos "OpenCanary Server" opencanary && \
    echo "opencanary ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/opencanary

COPY --from=build /opt/opencanary/. /opt/opencanary/

RUN chown -R opencanary:opencanary /etc/opencanaryd /opt/opencanary && \
    sudo -H -u opencanary bash -c ""

USER opencanary

RUN cd /opt/opencanary && . ./bin/activate && exec ./bin/opencanaryd --copyconfig
RUN sed -i --regexp-extended 's/^(\s+".*\.enabled": )false,/\1true,/g' /etc/opencanaryd/opencanary.conf && \
    sed -i --regexp-extended 's/^(\s+"rdp.enabled": )true,/\1false,/g' /etc/opencanaryd/opencanary.conf && \
    sed -i --regexp-extended 's/^(\s+"portscan.enabled": )true,/\1false,/g' /etc/opencanaryd/opencanary.conf && \
    cat /etc/opencanaryd/opencanary.conf

EXPOSE 1433/tcp
EXPOSE 8001/tcp
EXPOSE 5000/tcp
EXPOSE 9418/tcp
EXPOSE 3306/tcp
EXPOSE 6379/tcp
EXPOSE 80/tcp
EXPOSE 21/tcp
EXPOSE 22/tcp
EXPOSE 23/tcp
EXPOSE 5060/udp
EXPOSE 69/udp
EXPOSE 123/udp
EXPOSE 161/udp                  

CMD cd /opt/opencanary && . ./bin/activate && exec ./bin/opencanaryd --dev
