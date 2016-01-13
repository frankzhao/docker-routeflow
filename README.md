# docker-routeflow
RouteFlow in a container. For the Routeflow project, see https://github.com/CPqD/RouteFlow

The initial command will set up and run `rftest` as per the [RouteFlow tutorial](https://github.com/routeflow/RouteFlow/wiki/Tutorial-1:-rftest1).

Install
---

```
make
make run
```

By default port 6633 is exposed for the controller. In order to connect an external OpenvSwitch, set the bridge controller to the IP of this container and port 6633.

```
ovs-vsctl set-controller br-int tcp:<ip>:6633
```
