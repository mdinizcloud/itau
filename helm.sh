helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

helm upgrade --install ingress-nginx ingress-nginx \ 
             --repo https://kubernetes.github.io/ingress-nginx \ 
             --namespace ingress-nginx \
             --create-namespac



# uninstall ingress controller
helm uninstall ingress-nginx -n ingress-ngins

# install ingress controller with NLB
helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx  --namespace ingress-nginx --create-namespace \
  --set-string controller.service.annotations."service\.beta\.kubernetes\.io/aws-load-balancer-type"="nlb"