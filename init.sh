#!/bin/sh
brctl addbr lxcbr0
ovsdb-tool create /etc/openvswitch/conf.db /usr/share/openvswitch/vswitch.ovsschema
ovsdb-server --remote=punix:$DB_SOCK --pidfile --detach
ovs-vswitchd unix:$DB_SOCK --detach --log-file=/var/log/openvswitch/ovs-vswitchd.log
mongod --fork --logpath /var/run/mongodb.log --logappend
cd /var/routeflow/rftest && timeout 10 ./create

/var/routeflow/rftest/rftest1
