#!/bin/bash

if [ ! -z ${PLUGIN_DEBUG} ]; then
  env
fi

echo ${PLUGIN_TOKEN} | base64 -d > token
echo ${PLUGIN_CERT} | base64 -d > ca

kubectl config set-cluster default --server=${PLUGIN_SERVER} --certificate-authority=ca
kubectl config set-credentials ${PLUGIN_SERVICE_ACCOUNT} --token="$(cat token)"
kubectl config set-context default --cluster=default --user=${PLUGIN_SERVICE_ACCOUNT}
kubectl config use-context default

kubectl -n ${PLUGIN_NAMESPACE} set image deployment/${PLUGIN_DEPLOYMENT} ${PLUGIN_CONTAINER}=${PLUGIN_REPOSITORY}:${PLUGIN_TAG} --record

SH=$(kubectl config unset users.${PLUGIN_SERVICE_ACCOUNT})
SH=$(kubectl config unset contexts.default)
SH=$(kubectl config unset clusters.default)
SH=$(rm -rf /root/.kube token ca)
