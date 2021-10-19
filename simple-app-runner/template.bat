rem     --set app.ingressExtra[0].backendHttps=true
rem     --set app.volumes[0].name=nfs-1 ^
rem     --set app.volumes[0].spec.persistentVolumeClaim.claimName=nfs-provisioner-1 ^
rem     --set app.volumeMounts[0].name=nfs-1 ^
rem     --set app.volumeMounts[0].mountPath=/export ^
rem     --set app.service.extra[0].name=images ^
rem     --set app.service.extra[0].spec.type=ExternalName ^
rem     --set app.service.extra[0].spec.externalName=server.com ^
rem     --set app.ingressExtra[0].name=images ^
rem    --set app.ingressExtra[0].path=/images ^
rem    --set app.ingressExtra[0].servicePort=443 ^

helm template . -f values.yaml -n app-chart-namespace ^
  --set app.cronjob.enabled=true ^
  --set app.service.containerPort=3306 ^
  --set app.service.port=3306 ^
  --set app.env.VXXXAR1=valussse1 ^
  --set app.env.VAVVVR2=valssddue2 ^
  --set app.env.VAROBj1.valueFrom.secretKeyRef.name=secret-name ^
  --set app.env.VAROBj1.valueFrom.secretKeyRef.key=secret-key ^
  --set app.tolerations[0].key=ecomm ^
  --set app.tolerations[0].operator=Equal ^
  --set app.tolerations[0].value=prod ^
  --set app.tolerations[0].effect=NoSchedule ^
  --set app.ingress.annotations.nginx\.ingress\.kubernetes\.io\/permanent-redirect-code=301 ^
  --set app.initContainer.image.repository=busybox ^
  --set app.initContainer.image.tag=latest ^
  --set app.volumes[0].name=nfs-1 ^
  --set app.volumes[0].claimName=claim1 ^
  --set app.volumes[0].mountPath=/export ^
  --set app.configs[0].name=appsettings.json ^
  --set app.configs[0].path=/app ^
  --set app.configs[0].content=a123 1> template.yaml

