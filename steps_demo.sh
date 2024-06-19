t apply

aws eks --region $(t output -raw region) update-kubeconfig --name $(t output -raw cluster_name) --no-verify-ssl

k apply -f 1_nginx-ingress/crds/
k apply -f 1_nginx-ingress/manifest.yaml



k -n nginx-ingress port-forward svc/nginx-ingress 80   #yaml

