
1 - Explicação documento
2 - Explicação alias
2 - Terraform construção
2.1 - Explicação state
3 - Secrets TLS
4 - Explicação VPC



aws eks --region $(t output -raw region) update-kubeconfig --name $(t output -raw cluster_name) --no-verify-ssl


## DEPLOY NGINX INGRESS ************************************************************************ ##
k apply -f ./yaml/crds/ -n nginx-ingress
k apply -f ./yaml/common/ -n nginx-ingress


k apply -f ./yaml/rbac/rbac.yaml -n nginx-ingress

k apply -f ./yaml/daemon-set/nginx-ingress.yaml -n nginx-ingress


k apply -f ./yaml/service/loadbalancer-aws-elb.yaml
## ********************************************************************************************* ##





k -n nginx-ingress port-forward svc/nginx-ingress 443   #yaml



381FB0619A4396128B36B23FD205E3A5.gr7.us-east-1.eks.amazonaws.com


aws resourcegroupstaggingapi get-resources --region us-east-1 | grep -i resource | wc -l

28





k delete ns nginx-ingress $f
k delete -f ./yaml/common/ingress-class.yaml $f
k delete -f ./yaml/common/ns-and-sa.yaml $f
k delete -f ./yaml/shared-examples/default-server-secret.yaml $f
k delete -f ./yaml/common/nginx-config.yaml $f
k delete -f ./yaml/rbac/rbac.yaml $f
k delete -f ./yaml/crds/ $f
k delete -f ./yaml/daemon-set/nginx-ingress.yaml $f


























##old
git config --global --add safe.directory data/SSD_MAIN/github/aws/itau/.terraform/modules/vpc
git config --global --add safe.directory /data/SSD_MAIN/github/aws/itau/.terraform/modules/eks
git config --global --add safe.directory /data/SSD_MAIN/github/aws/itau/.terraform/modules/eks.kms
git config --global --add safe.directory /data/SSD_MAIN/github/aws/itau/.terraform/modules/vpc