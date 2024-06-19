
k apply -f ns-and-sa.yaml
k apply -f rbac.yaml
k apply -f default-server-secret.yaml
k apply -f nginx-config.yaml
k apply -f ingress-class.yaml
k apply -f crds.yaml
k apply -f nginx-ingress_daemonset.yaml
k apply -f loadbalancer-aws-elb.yaml



