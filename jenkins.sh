#! /bin/bash

set -x

oc new-project gitlab

helm upgrade --install gitlab gitlab/gitlab --set nginx-ingress.enabled=false  --set global.hosts.domain=apps.bos.bynet.dev --set global.ingress.configureCertmanager=false --set certmanager.install=false --set gitlab-runner.install=false

kubectl get secret gitlab-wildcard-tls-ca -ojsonpath='{.data.cfssl_ca}' | base64 --decode > gitlab.pem

namespace="jenkins"

oc new-project $namespace

oc adm policy add-scc-to-user privileged system:serviceaccount:$namespace:default
oc adm policy add-cluster-role-to-user edit system:serviceaccount:$namespace:default

oc create -f pv.yaml 

oc create -f pvc.yaml 

oc create configmap ca-pemstore --from-file=./gitlab.pem -n $namespace

oc apply -f jenkinsDeployment.yaml

oc expose dc jenkins

oc apply -f jenkinsRoute.yaml

oc apply -f ClusterRole.yaml
oc adm policy add-cluster-role-to-user CreatePods system:serviceaccount:$namespace:default

apt-get install ca-certificates
cp gitlab.pem /usr/local/share/ca-certificates/gitlab.crt
update-ca-certificates