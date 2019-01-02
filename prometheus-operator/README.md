# Deploy a Prometheus operator

- create a new namespace named `titans`

````
$ oc new-project titans
````

- create a Prometheus Operator subscription:

`operator-sub.yml`

````
apiVersion: operators.coreos.com/v1alpha1
kind: Subscription
metadata:
  generateName: prometheus-
  namespace: titans
spec:
  source: rh-operators
  name: prometheus
  startingCSV: prometheusoperator.0.22.2
  channel: preview
````
````
$ oc create -f operator-sub.yml
````
- create a `prometheus-example` operator definition:

`prometheus-example.yml`

````
apiVersion: monitoring.coreos.com/v1
kind: Prometheus
metadata:
  name: prometheus-example
  labels:
    prometheus: k8s
  namespace: trilliams
spec:
  replicas: 2
  version: v2.3.2
  serviceAccountName: prometheus-k8s
  securityContext: {}
  serviceMonitorSelector:
    matchExpressions:
      - key: k8s-app
        operator: Exists
  ruleSelector:
    matchLabels:
      role: prometheus-rulefiles
      prometheus: k8s
  alerting:
    alertmanagers:
      - namespace: monitoring
        name: alertmanager-main
        port: web
````

- create the operator:

````
$ oc create -f prometheus-example.yml
````
