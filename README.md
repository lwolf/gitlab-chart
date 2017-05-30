# Helm chart to install Gitlab

This chart is based on [my manifests](https://github.com/lwolf/kubernetes-gitlab) 
for manual deployment with lots of improvements.

 
Some of the features:
* Fully automated installation of Gitlab. 
* Register and manage Letsencrypt certificates with [kube-lego](https://github.com/jetstack/kube-lego)
* Deploys PostgreSQL, Redis and Minio as part of the setup
* Deploys fully configured Docker registry with external domain (letsencrypt) and integration with gitlab.
* Semi-automatic creating of Runner
* Ability to customize any of the [environment variables](https://github.com/sameersbn/docker-gitlab#available-configuration-parameters)

## Requirements
* Kubernetes 1.5 (for StatefulSets support). 1.6 is not supported yet. Pull requests are very welcome.
* PV support on the underlying infrastructure
* Helm 2.2.0 (for conditions and flags support)

## Quick installation

```
# add repository (needed for dependencies)
$ helm repo add lwolf-charts http://charts.lwolf.org

# get default values.yaml file
$ curl https://raw.githubusercontent.com/lwolf/gitlab-chart/master/gitlab/values.yaml -o values-test.yaml

# install
$ helm install -f values-test.yaml lwolf-charts/gitlab
# Wait until gitlab is up and running.
$ while ! curl --output /dev/null --silent --head --fail https://gitlab.example.com/help; do sleep 1 && echo -n .; done
...................................................

# Open gitlab runner configuration and check that Runner is successfully registered.
# Copy token and run upgrade.
$ helm upgrade -f values-test.yaml --set runner.token=<TOKEN> <install-name> lwolf-charts/gitlab --namespace=gitlab
```

## TODO:
- [x] splitting registry/runner into separate charts
- [x] Add support for gitlab pages
- [x] Upgrade to v9
- [] Upgrade to Kubernetes 1.6+
- [] testing/refactoring
- [] more flexible runner configuration
- [] monitoring of the whole thing in Prometheus
