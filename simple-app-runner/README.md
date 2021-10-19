# HELM Chart for a particular application for Kubernetes.

## Prerequisites

* This chart requires Docker Engine 1.8+ in any of their supported platforms.  Please see vendor requirements [here for more information](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker).

## Chart Components

* Creates a any docker image application as kubernetes deployment
* Creates a Kubernetes Service on specified port (default: 80)
* Creates a Ingress (if configured)
* Creates a CronJob instead of kubernetes deployment

## Installing the Chart

First add repo 

```console
helm repo add actonica-charts https://actonica.github.io/charts/
```

You can install the chart with the release name `mymssql` as below.

```console
$ helm install --name sample-release actonica-charts/simple-app-runner --set app.image.repository=nginx
...
```

> Note - If you do not specify a name, helm will select a name for you.

