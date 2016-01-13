FROM ubuntu:12.04
MAINTAINER Frank Zhao frank@frankzhao.net

ENV DB_SOCK=/var/run/openvswitch/db.sock

# Install essential packages
RUN apt-get update \
    && apt-get install -y build-essential git libboost-dev \
        libboost-program-options-dev libboost-thread-dev \
        libboost-filesystem-dev iproute-dev openvswitch-switch \
        lxc mongodb netcat net-tools python-pymongo \
    && apt-get clean all

RUN git clone git://github.com/routeflow/RouteFlow.git /var/routeflow \
	&& cd /var/routeflow \
	&& make rfclient \
	&& mkdir -p /data/db && mkdir -p /var/run/openvswitch

COPY create /root/create
COPY init.sh /root/init.sh

RUN chmod +x /root/create && chmod +x /root/init.sh

EXPOSE 6633

CMD ["/root/init.sh"]
