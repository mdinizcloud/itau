# Cassandra Deployment
<pre>k apply -f ssd-class.yaml
k apply -f cassandra-statefulset.yaml

k exec -it cassandra-0 -- nodetools status </pre>

# Test DNS Resolution
<pre>k run dig --image=tutum/dnsutils --restart=Never --rm=true --tty --stdin --command -- dig cassandra.default.svc.cluster.local

k cordon gke-k8s-infra-gcp-k8s-infra-gcp-0a6a89e6-3fq1 </pre>

>**NOTE:** Persistent disk must reside at the same zone.

# Storage Solution Rook
<pre>wget https://github.com/rook/rook/archive/v1.0.6/zip

unzip v1.0.6.zip

https://github.com/rook/

git clone --single-branch --branch master https://github.com/rook/rook.git </pre>