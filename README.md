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
* Kubernetes 1.5 (for StatefulSets support)
* PV support on the underlying infrastructure
* Helm 2.2.0 (for conditions and flags support)
 
## TODO:
- [x] splitting registry/runner into separate charts
- [x] Add support for gitlab pages
- [x] Upgrade to v9
- [] testing/refactoring
- [] more flexible runner configuration
- [] monitoring of the whole thing in Prometheus
