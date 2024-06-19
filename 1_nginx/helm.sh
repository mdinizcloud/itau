helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

k create namespace nginx-ingress

helm install ingress-nginx ingress-nginx/ingress-nginx \
--namespace nginx-ingress \
--set controller.metrics.enabled=true \
--set-string controller.metrics.service.annotations."prometheus\.io/port"="10254" \
--set-string controller.metrics.service.annotations."prometheus\.io/scrape"="true"

EXTERNAL_IP=35.172.151.118

curl -v telnet://$EXTERNAL_IP:80
curl -v telnet://$EXTERNAL_IP:443














k create deployment demo  --image=httpd  --port=80 
k expose deployment demo

k create ingress demo --rule www.demo.io/=demo:80
#k create ingress demo --class=nginx --rule www.demo.io/=demo:80



k -n nginx-ingress port-forward svc/ingress-nginx-controller 80


curl -v aabf1c33aa0f34779ac8db137c40f8f5-1544106606.us-east-1.elb.amazonaws.com



curl --resolve www.demo.io:80:$EXTERNAL_IP http://www.demo.io
curl --connect-to www.demo.io:80:$EXTERNAL_IP http://www.demo.io

curl --resolve www.demo.io:80:127.0.0.1 http://www.demo.io
curl --connect-to www.demo.io:80:127.0.0.1 http://www.demo.io


curl -v 'telnet://35.172.151.118:80'




EXTERNAL_IP=35.172.151.118
SAMPLE_TRAFFIC_NAMESPACE=nginx-sample-traffic
curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/service/cwagent-prometheus/sample_traffic/nginx-traffic/nginx-traffic-sample.yaml | 
sed "s/{{external_ip}}/$EXTERNAL_IP/g" | 
sed "s/{{namespace}}/$SAMPLE_TRAFFIC_NAMESPACE/g" | 
kubectl apply -f -


