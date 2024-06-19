#port_forward
k -n nginx-ingress port-forward svc/nginx-ingress 443   #yaml
k -n ingress-ngin port-forward svc/ingress-nginx-controller 443 #helm

curl -kv https://localhost


#service_a_and_b
k apply -f ./service-a.yaml
k apply -f ./service-b.yaml

k port-forward svc/service-a 80

curl http://localhost
curl http://localhost/path-a.html       goes to root /path-a.html
curl http://localhost/path-b.html       goes to root /path-b.html
#any_other_error

https://service-a.cybertron.com/ --> ingress >> k8s_service --> http://service-a
https://service-b.cybertron.com/ --> ingress >> k8s_service --> http://service-b

## DOMAIN NAME ROUTING *************************************************************************** ##
k apply -f routing-by-domain.yaml

curl -kivL 'https://services-a.cybertron.com' -H 'Host: services-a.cybertron.com'       #details
curl -k https://services-a.cybertron.com  #"/" on service-a
curl -k https://services-b.cybertron.com  #"/" on service-b
curl -k https://services-a.cybertron.com/path-a.html     #"/path-a.html" on service-a
curl -k https://services-a.cybertron.com/path-b.html     #"/path-b.html" on service-a
curl -k https://services-b.cybertron.com/path-a.html     #"/path-a.html" on service-b
curl -k https://services-b.cybertron.com/path-b.html     #"/path-b.html" on service-b

## DOMAIN PATH ROUTING *************************************************************************** ##
k apply -f routing-by-path.yaml

curl -k https://services.cybertron.com/service-a 
curl -k https://services.cybertron.com/service-b 

curl -k https://services.cybertron.com/service-a/path-a.html     #"/path-a.html" on service-a
curl -k https://services.cybertron.com/service-a/path-b.html     #"/path-b.html" on service-a
curl -k https://services.cybertron.com/service-b/path-a.html     #"/path-a.html" on service-b
curl -k https://services.cybertron.com/service-b/path-b.html     #"/path-b.html" on service-b

k logs pod/ingress-nginx-controller-55474d95c5-72n86 -f


## PASSWORD AUTHENTICATION ********************************************************************* ##
k apply -f routing-with-auth.yaml

apt install apache2-utils
htpasswd -c auth service-a-user
k create secret generic server-a-secret --from-file=auth

curl -u 'service-a-user:$apr1$58U13DDd$Iv0J2tBleyZu0Q2GaIVLV0' -k https://services.cybertron.com/service-b/path-b.html
curl -u 'admin:2w3e4r!Q@W#E' jenkins.cybertron.com


## CREATE SSL SECRETS *************************************************************************** ##
k create secret tls ingress-nginx --cert=./ingress-tls.cer --key=./ingress-tls.key

cat privatey.key > ingress.pem
cat public.cer >> ingress.pem
cat root.cer >> ingress.pem
openssl rsa -check -in ingress.pem -noout



curl -k --resolve services.cybertron.com:127.0.0.1 https://services.cybertron.com/service-a 
curl -k --resolve services.cybertron.com:192.168.100.147 https://services.cybertron.com/service-a 


curl http://192.168.100.147/healthz



https://github.com/kubernetes/ingress-nginx
## ********************************************************************************************** ##
