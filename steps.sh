t apply

aws eks --region $(t output -raw region) update-kubeconfig --name $(t output -raw cluster_name) --no-verify-ssl

k apply -f 1_nginx-ingress/crds/
k apply -f 1_nginx-ingress/manifest.yaml

k -n nginx-ingress port-forward svc/nginx-ingress 80   #yaml

change dns

k apply -f ingress-resource.yaml

curl http://localhost

curl --connect-to www.itau.com.br:80:127.0.0.1 http://www.itau.com.br

curl --connect-to www.itau.com.br::127.0.0.1 http://www.itau.com.br
