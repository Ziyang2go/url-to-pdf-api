# Mythreekit Client App

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ cd .../clients
$ helm install --name my-release --namespace blue chart
```

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release --purge
```
## Upgrading the Chart

To upgrade the chart with the different key, value

```console
$ cd .../clients
$ helm upgrade my-release --reuse-values --set key=value chart
```
The command removes all the Kubernetes components associated with the chart and deletes the release.


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```console
$ helm install --name my-release \
  --set name=weevers \
    chart
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart. For example,

```console
$ helm install --name my-release -f values.yaml chart
```
