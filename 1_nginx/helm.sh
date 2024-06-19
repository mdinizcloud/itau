helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

kubectl create namespace nginx-ingress

helm install ingress-nginx ingress-nginx/ingress-nginx \
--namespace nginx-ingress \
--set controller.metrics.enabled=true \
--set-string controller.metrics.service.annotations."prometheus\.io/port"="10254" \
--set-string controller.metrics.service.annotations."prometheus\.io/scrape"="true"

k create deployment demo  --image=httpd  --port=80 

k expose deployment demo


k create ingress demo --class=nginx --rule www.demo.io/=demo:80


k -n nginx-ingress port-forward svc/ingress-nginx-controller 80


curl -v aabf1c33aa0f34779ac8db137c40f8f5-1544106606.us-east-1.elb.amazonaws.com



curl --resolve www.demo.io:80:54.152.247.249 http://www.demo.io
curl --connect-to www.demo.io:80:54.152.247.249 http://www.demo.io

curl --resolve www.demo.io:80:127.0.0.1 http://www.demo.io
curl --connect-to www.demo.io:80:127.0.0.1 http://www.demo.io