helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

k create ns nginx-ingress

helm install ingress-nginx ingress-nginx/ingress-nginx \
--namespace nginx-ingress \
--set controller.metrics.enabled=true \
--set-string controller.metrics.service.annotations."prometheus\.io/port"="10254" \
--set-string controller.metrics.service.annotations."prometheus\.io/scrape"="true" \
--set controller.ingressClassResource.default=true 



EXTERNAL_IP=35.172.151.118

curl -v telnet://$EXTERNAL_IP:80
curl -v telnet://$EXTERNAL_IP:443

