
k apply -f ns-and-sa.yaml
k apply -f rbac.yaml
k apply -f default-server-secret.yaml
k apply -f nginx-config.yaml
k apply -f ingress-class.yaml


k apply -f crds/
k apply -f https://raw.githubusercontent.com/nginxinc/kubernetes-ingress/v3.5.2/deploy/crds.yaml

k apply -f nginx-ingress_daemonsets.yaml
k apply -f loadbalancer-aws-elb.yaml



