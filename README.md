# Helm chart to deploy CrateDB

CrateDB is a distributed SQL database built on top of a NoSQL foundation. You can find all about it here: https://crate.io/ Bottom line is, that this is a database, running on more than one node. Which is nice to cope with increasing load. It is also perfect to run on a Kubernetes cluster.

## Credits / License
Everything you find here is licensed under MIT license and that means, you can do whatever you want with it. However do not expect any warranty - this is open source. If you find something, that is not working, consider fixing it. Pull requests are welcome! 

## Prerequisites / Tested Environmnets

- Kubernetes 1.25
- Helm 3

## Installing/Upgrading/Uninstalling
So far chart is not pushed to a registry and thus you have to clone it. Once everything is on your local disk, create a custom values file and deploy crate db with a command like that:

```bash
$ helm install yourname . -f custom-values.yaml
```
Same goes for upgrading installation:

```bash
helm upgrade yourname . -f custom-values.yaml
```
```bash
$ helm delete yourname 
```
Getting rid of stateful sets is done like so. Also note, that you can set stateful sets to 0 in case you just want to shutdown your app, without deleting installation.

```bash
$ kubectl delete statefulsets --cascade=false yourname
```

With all commands note, that you can (and should) add -n namespace, to do all actions in a non default namespace. In any case please read Helm docs before using this stuff.


## Custom Values

TODO