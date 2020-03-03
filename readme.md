![Github Action](https://github.com/kimtaek/kubedeploy/workflows/Build%20and%20Publish/badge.svg)

### usage

```bash
docker run --rm \
   -e PLUGIN_NAMESPACE=develop \
   -e PLUGIN_SERVICE_ACCOUNT=deploy \
   -e PLUGIN_TOKEN=ZXlKaGJHY2lPaUpTVXp... \
   -e PLUGIN_SERVER=https://D34...DE.ap-northeast-2.eks.amazonaws.com \
   -e PLUGIN_CERT=LS0tLS1... \
   -e PLUGIN_DEPLOYMENT=api \
   -e PLUGIN_CONTAINER=api \
   -e PLUGIN_REPOSITORY=my/repository \
   -e PLUGIN_TAG=hash \
   -e PLUGIN_DEBUG=true \
   -e PLUGIN_WATCH=true \
   jinze1991/kubedeploy
```

##### [optional] PLUGIN_DEBUG (default: `false`)
```bash
echo env
```

##### [optional] PLUGIN_WATCH (default: `false`)
```bash
Waiting for deployment "api" rollout to finish: 2 old replicas are pending termination...
Waiting for deployment "api" rollout to finish: 1 old replicas are pending termination...
Waiting for deployment "api" rollout to finish: 1 of 2 updated replicas are available...
deployment "api" successfully rolled out
```