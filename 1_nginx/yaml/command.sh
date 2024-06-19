# VERSION LIST ********************************************************** ##
https://github.com/kubernetes/ingress-nginx


## GIT NGINX CLONE *********************************************************** ##
https://github.com/nginxinc/kubernetes-ingress.git


## DEPLOY NGINX INGRESS ************************************************************************ ##
k apply -f ns-and-sa.yaml
k apply -f default-server-secret.yaml
k apply -f nginx-config.yaml
k apply -f rbac.yaml
k apply -f crds/
k apply -f nginx-ingress.yaml
k apply -f ingress-class.yaml
k apply -f loadbalancer-aws-elb.yaml
## ********************************************************************************************* ##



## DELETE NGINX INGRESS ***************************************************** ##
k delete -f common/ns-and-sa.yaml
k delete -f shared-examples/default-server-secret.yaml
k delete -f common/nginx-config.yaml
k delete -f rbac/rbac.yaml
k delete -f crds/
k delete -f daemon-set/nginx-ingress.yaml
k delete -f common/ingress-class.yaml
k delete -f service/loadbalancer.yaml
## ************************************************************************** ##