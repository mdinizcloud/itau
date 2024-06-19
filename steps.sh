t apply

aws eks --region $(t output -raw region) update-kubeconfig --name $(t output -raw cluster_name) --no-verify-ssl

k apply -f 1_nginx-ingress/crds/
k apply -f 1_nginx-ingress/manifest.yaml



k -n nginx-ingress port-forward svc/nginx-ingress 80   #yaml

change dns

k apply -f ingress-resource.yaml

curl http://localhost



curl --resolve www.demo.io:80:3.108.142.158 http://www.demo.io


curl --connect-to www.itau.com.br:80:127.0.0.1 http://www.itau.com.br
curl --connect-to www.itau.com.br::127.0.0.1 http://www.itau.com.br


curl -v a2f324b078f4343cd8965e5c976cc24c-412dfb1aeafaca26.elb.us-east-1.amazonaws.com




helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm install ingress-nginx ingress-nginx -n ingress-nginx


helm install my-release oci://ghcr.io/nginxinc/charts/nginx-ingress --version 1.2.2 --set controller.image.repository=myregistry.example.com/nginx-plus-ingress --set controller.nginxplus=true
