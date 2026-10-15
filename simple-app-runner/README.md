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

## Health checks

* `app.livenessProbe` - by default a tcpSocket check of `app-port` (initialDelaySeconds: 300, timeoutSeconds: 30). Timing-only values keep the tcpSocket check; a handler (`httpGet`, `tcpSocket`, `exec`, `grpc`) replaces it.
* `app.readinessProbe`, `app.startupProbe` - rendered as-is, only when set.

```console
$ helm upgrade --install sample-release actonica-charts/simple-app-runner --wait --timeout 3m \
    --set app.livenessProbe.httpGet.path=/health \
    --set app.livenessProbe.httpGet.port=app-port \
    --set app.readinessProbe.httpGet.path=/health \
    --set app.readinessProbe.httpGet.port=app-port \
    --set app.startupProbe.httpGet.path=/health \
    --set app.startupProbe.httpGet.port=app-port \
    --set app.startupProbe.periodSeconds=5 \
    --set app.startupProbe.failureThreshold=24
```

Keep `--timeout` above the startup window (`periodSeconds` x `failureThreshold`, 2 minutes here) plus image pull time.

