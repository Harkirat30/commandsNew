**********************Interview questions********************************************************************************************* 


1) etcd port is 2379
2) advertise client URLs is the address on which etcd listens - it happens to be on the **Ip of server** and port 2379 -- https://{internal-ip}:2379 , this URL should be configured on etcd server when it tries to reach the etcd server
3) To see all keys stored by k8's run --> **kubectl exec etcd-master -n kube-system etcdctl get / --prefix -keys-only**
root Directory in the ouput is a registry, under that u have k8's constructs - minions, pods, replicasetss

4) kubectl exec etcd-master -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / --prefix --keys-only --limit=10 --cacert /etc/kubernetes/pki/etcd/ca.crt --cert /etc/kubernetes/pki/etcd/server.crt  --key /etc/kubernetes/pki/etcd/server.key" 

5) IF cluster is deployed via kubeadm tool, u can see the certs at --> cat /etc/kubernetes/manifests/kube-apiserver.yaml
6) in non kubeadm setup see the svc at --> cat /etc/systemd/system/kube-apiserver.service , or do **ps -aux | grep kube-apiserver** 
7) *Kube-proxy* is a process that runs on every node, **it's job is to look for new svc**, and creates rules on each node to forward traffic to those services to the backend pods, (one way is using IP tables rules), it is deployed as **Daemon set** 

8) kubectl scale --replicas=6 replicaset myall-replicaset (this won't change value in file)
9) for pod1 to reach svc in diff namespace we do --->>   x.connect("svc-name.namespace.svc.cluster.local) 
10) When a svc is created a DNS entry is automatically added in above format , (cluster.local is default domain name of k8's cluster, svc is sub-domain of service and then we have namespace)
11) changing namespace - kubectl config set-context $(kubectl config current-context) --namespace=dev, in openshift it is oc project <namespace-name>

12) Resource quota can be created to limit resources in a namespace
13) If a node (192.168.1.2 runs a pod (10.244.0.2) - we can ssh into the node and then do a curl -> curl http://10.244.0.2 and then see the webapp that the pod is running)
but if i want to do a curl to the node -Ip from my laptop and see the webpage - i need something to map the requests from node to pod
By using node-port above thing can be done -->> http://192.168.1.2:3008 (30000-32767) , target port is container port and normal port is the svc port
14) svc acts as a built in load balancer which uses random algorithm and distributes traffic to the pods
15) if pods are hosted on 2 nodes but via the node port svc the pods would be accessible on all the IP's of the nodes
16) apply command -->>   local file , last applied configuration(json format) and Kubernets memory object (live object config) 
last applied config helps us to figure out if some fields have been removed , so that field is removed from live obj and then removed from last applied config
this last applied config is stored in the live object config(k8's memory under annotations) - kubectl.kubernetes.io/last-applied-configuration
17) kubectl get pods --selector app=app1
18) Finally let’s look at annotations. While labels and selectors are used to group and select objects, annotations
are used to record other details for inflammatory purpose.
For example tool details like name, version build information etc or contact details, phone numbers, email
ids etc, that may be used for some kind of integration purpose. 
19) taint is on node and tolerant on pod, **kubectl taint node node-name key=value:taint-effect(NoSchedule/Prefer-no-schedule/noExcute),** toleration are added to pods,master node has a taint set to not accept pod
20) Taints and tolerations are only meant for restricting nodes for accepting certain pods, but that pods can be placed on diff nodes also
21) 
# IF the requirement is to restrict a certain pod to a certain node - then need to use nodeAffinity rules 
22) nodeSelector - we assign the nodeSelector and under that add labels and pod moves to the node which has matching labels, we need to label the node before creating it
23) Above thing won't meet complex requirements, so we use node Affinity (it's feature is that pod's are hosted on paticular nodes) 
eg - we can use operator exists and that will ensure that if label exist the pod will fall on that node
24) Taints and tolerations won't guarantee that a tolerated pod lands on tainted node, meaning a tolerated pod can land on a diff node which has no taint also, but with alone node affinity - 
the required pods will land on the specific node, but other pods can also land on them , so a combination of both can be used.
25) basic limit --> 0.5 vcpu and 256 Mi, in docker a process can take as much memory and cpu required , if pod uses more than specified limits - cpu gets throttled (cannot use more cpu) but memory can be increased - but if it constantly uses more than limit - it is removed then 
26) When a pod is created the containers are assigned a default CPU request of .5 and memory of 256Mi". For the POD to pick up those defaults you must have first set those as default values for request and limit by creating a LimitRange in that namespace.
27) **Use cases of Daemon set - Monitoring agent and log viewer, eg -kube-proxy or netwoking agent like weave-net** 
28) Daemonset is scheduled by using node affinity and default scheduler after v1.12 and before that we wre using nodeName
29) We can configure kubelet to read manifests files in the designated folder - /etc/kubernetes/manifests , kubelet creates pods , kubelet works at pod level, 
the Directory is passed in to the kubelet --> as --pod-manifest-path=/etc/kubernetes/manifests, 
instead of specfying the value in kubelet.service file , we specify a kubeconfig file, --kubeconfig=/var/lib/kubelet/kubeconfig and in that file define the path as staticPodPath : /etc/kubernetes/manifests
30) static pods can be seen by running docker ps command , 
kubelet can create pods using manifests folder in specified path or second is taking requests through http API endpoint
31) when u list the pods down - u see the mirror object shown by kube-api server - name of pod is appended by node name
32) We can have multiple schedulers running , set leader-elect option to false in multiple masters (HA) setup and in pod definition file pass in the scheduler name
kubectl get events will tell you - which scheduler picked it up,
33) Monitoring cluster - we have metrics server  and properietary solutions like DataDog , metrics server is an in-memory solution and does not store data on disk
34) Kubelet runs a component called cAdvisor or container advisor - it is responsible for retreiving performance metrics from pods and expsoing them from kubelet API to make metrics available for metrics server
35) logs
in docker --> docker run kodekloud/event-simulator to livestream the logs,
if i run the docker container in a detached mode i won't see the logs - docker run -d kodekloud/event-simulator
docker logs -f <container-id> , it will livestream the logs

kubectl logs -f pod-name 
kubectl logs -f pod-name <container-name> (in case multiple containers are running inside a single pod) 

36) kubectl rollout status deployment/<deployment-name>
kubectl rollout history deployment/<deployment-name> , we use re-create Strategy in deployment as the pod serving UI is only 1
One by one is Rolling update Strategy>>  here replicaset gets destoryed and new is created Simultaneoulsy , 
37) Rolling out a deployment --> kubectl rollout undo deployment/<deployment-name> 
38) Commands and Arguments in pod definition file 
See Dockerfile for the containers - there is a CMD (default command) (it defines the program which will run when the container will start) 
if CMD ["bash"] - means it accepts the command to be run and exits if it doesn't get it 
if we want to change the command, we create another image

FROM Ubuntu
CMD sleep 5

and call above as ubuntu-sleeper
this image will sleep for 5 sec and exit , now if we want to change the no of sec it sleeps, like - docker run ubuntu-sleeper 10 , this can be achieved by using ENTRYPOINT instruction

FROM Ubuntu
ENTRYPOINT ["sleep"] 

so 10 will get appended to the entrypoint , so command which will be run at entrypoint will be sleep 10


In case of CMD the command line parameters passed will get replaced entirely whereas in case of entrypoint the command line parameters get appended

NOW if we use both 

FROM Ubuntu
ENTRYPOINT ["sleep"] 
CMD["5"]                                        NOTE: Entrypoint and CMD should be in a json format

if we didn't specify any parameter - command will be sleep 5 , but if we specify a paramter command will be sleep 10 if 10 is passed like -> docker run ubuntu-sleeper 10
If you really want to override the entrypoint at startup u can use -->> docker run --entrypoint sleep2.0 ubuntu-sleeper 10 , so command at start up will be sleep2.0 10

# docker run --name ubuntu-sleeper ubuntu-sleeper (docker run --name <name> <image>) --> this will be a normal pod (basically we are naming the running pod) 
docker run --name ubuntu-sleeper ubuntu-sleeper 10 , the additional apended value will go inside the args property of the file like an array ["10"]

So basically with the agrs field in the pod definition file we ovveride the CMD in dockerfile, but if u want to override the ENTRYPOINT , 
in docker we do like --> docker run --name ubuntu-sleeper --entrypoint sleep2.0 ubuntu-sleeper 10 

while in pod - the field will be command field --> command: ["sleep2.0"] , so ENTRYPOINT is replaced with **command** , while **CMD is replaced with args**
In traydstream we have args - and that runs a shell script (because args will get run when container is run and hence a shell script will run)

so to summarize there are two fields that correspond to two instructions
in the docker file.
**The command field in pod definition file overrides the entry point instruction and the args field overrides the command instruction in the docker file**
Remember it is not the command field that overrides the CMD instruction in the docker file.

39) Specifying env variable in Docker --> docker run -e APP_COLOR=pink simple-webapp-color
40) We inject configmaps as single env variables 
41) for storing secrets variables -- use echo -n 'pass' | base64 
42) to see created secrets and values use --> kubectl get secret <secret-name> -o yaml 
43) decoding a hashed value --> echo -n 'wdwdddwd2' | base 64 --decode 
44) In trydstream we inject secrets and configmaps as single env variables - because in this we we create one secret and configmap and then whatever relevant obj required 
45) **We can Enabling Encryption at Rest for Secrets so they are stored encrypted in ETCD. (Solution)**
Also the way kubernetes handles secrets. Such as:
A secret is only sent to a node if a pod on that node requires it.
Kubelet stores the secret into a tmpfs so that the secret is not written to disk storage.
Once the Pod that depends on the secret is deleted, kubelet will delete its local copy of the secret data as well

46) Multi container pods are created and destroyed together they share the same network space which means they can refer to each other as
local host and they have access to the same storage volumes.
This way you do not have to establish volume sharing or services between the pods to enable communication between them 
47) When a POD is first created the initContainer is run, and the process in the initContainer must run to a completion before the real container hosting the application starts
48) Cluster maintenance - In openshift it is a single step away 
pod-eviction-timeout is set on controller manager for 5m , we use drain node and uncordon node mechanism, kubectl cordon command marks the node as Unschedulable but doesn't terminate the other pods,
49) kubectl > kube-apiserver > conroler-manager and kube-scheduler > kubelet and kube-proxy
50) upgrading cluster is easy on Openshift using clicks , so master is upgraded first followed by rest 
51) kubeadm upgrade plan --> it will give useful info on how to upgrade the cluster, before upgrading kubernetes we need to upgrade kubeadm tool 
52) backup and restore methods --> 
Velero by heptaio is a soln which is used to query the kube-apiserver and take back up of your objects in the cluster
53) or we choose to backup etcd cluster using snapshot solution 
if we are using managed kubernetes env - we might not have acccess to the etcd server
54) Kubernetes primitives -

- Controlling access to kube-api-server (who can access and what they can do), who can access -> Authentiction - using usernames and passwords, usernames or tokens, certificates or integration with external authentication provider like LDAP, for machines we create service account, 
what can they do - is determined by authorisation mechanisms, RBAC , or ABAC(attribute based access controls) node authorisation etc
- All communication between the components is secured using TLS encryption.
- And communication - by default all pods can access all pods within the cluster - this can be limited by using Network Policies 

55) Authentication 
We can create service accounts using the k8's API while we can't create users and need to rely on 3rd party tools to create users 
All user access is managed through the API server, whether a curl request curl https://kube-server-ip:6443/ or using kubectl 
kube-apiserver authenticates the users using -
* by using static username/password files, or tokens, or certificates or 3rd party identity services
* basic way - create a .csv file with user details and pass that inside the kube-api-server using --basic-auth-file=user-details.csv (note- the cluster ip range is also specified in the kubeapiserver)
so in kube-api-server.yaml file under command section-> you add basic-auth-file and restart the kube-api-server service
* Now to authenticate the user - specify the user and password in a curl command
curl -v -k https://master-node-ip:6443/api/vi/pods -u "user1:pass"

in user-details.csv where we had pass,users,userid - we can have 4th coloumn called group and also for user-token-details.csv - we will have tokens instead of passwords

and pass the --token-auth-file=user-details.csv in the kube-api-server
curl -v -k https://master-node-ip:6443/api/vi/pods --header "Authorisation:Bearer dkjhjkhejhejkfjbh"

above is not recommended 

In case of kubeadm we can do
  volumes:
  - hostPath:
      path: /tmp/users
      type: DirectoryOrCreate
    name: usr-details
    
and under spec:
spec:
  containers:
  - command:
    - kube-apiserver
    - --authorization-mode=Node,RBAC
      <content-hidden>
    - --basic-auth-file=/tmp/users/user-details.csv

then create necessary roles and rolebindings for the users.

55) SSL/TLS certificates 

ssh-keygen creates keys for SSH purposes
id_rsa and id_rsa.pub , then we add the public key in the server under ~/.ssh/authorized_keys
then u do ssh -i id_rsa user1@server1

Now to generate private and public key pair we use : openssl 
1) openssl genrsa -out my-bank.key 1024   (private)
2) openssl rsa -in my-bank.key -pubout > my-bank.pem (public)

We can create a CSR using the below methods ->
openssl req -new -key my-bank.key -out my-bank.csr -subj "/C=US/ST=CA/O=MyOrg,Inc.Co/CN=my-bank.com"

NOTE: .pem is for public certificates 

Public keys of all the CA's are built in to the browser, browser uses Public keys of CA to validate that they are signed by CA's themselves 

So a server sends a CSR to a CA, CA signs it using it's Private key and sends it back, the broswer has public key of the CA already installed

***********************************************NOTE**************************************************************************************************************************************

We have seen why you may want to encrypt messages being sent over a network to encrypt messages.
We use asymmetric encryption with a pair of public and private keys and admin uses a pair of keys to secure SSH connectivity to the servers. The server uses a pair of keys to secure HTTPS traffic.
For this the server first sends a certificate signing request to a CA.The CA uses its private key to sign the CSR.
Remember all users have a copy of the CAs public key.
The signed certificate is then sent back to the server the server configure is the web application with the signed certificate.
Whenever a user accesses the web application the server first sends the certificate with its public key.
The user or rather the user's browser reads the certificate and uses the CA's public key to validate
and retrieve the servers.
Public key it then generates a symmetric key that it wishes to use going forward for all communication.
The symmetric key is encrypted using the server as public key and sent back to the server the server
uses its private key to decrypt the message and retrieve the symmetric key.
The symmetric key is used for communication going forward so the administrator generates a key pair for securing SSH.
the web server generates a key pair for securing the web site with HTTPS, the Certificate Authority generates its own set of key pair to sign certificates.
The end user though only generates a single symmetric key.
Once he establishes trust with the Web site he uses his username and password to authenticate the Web server with the servers key pairs.
The client was able to validate that the server is who they say they are but the server does not for sure know if the client is who they say they are.
It could be a hacker impersonating a user by somehow gaining access to his credentials not over the network for sure.
as we have secured it already with TLS. May be some other means. Anyway,
So what can the server do to validate that the client is who they say they are for this as part of the
initial trust building exercise. The server can request a certificate from the client and so the client must generate a pair of keys
and a signed certificate from a valid CA the client then sends the certificate to the server for it
to verify that the client is who they say they are.
Now you must be thinking you have never generated a client's certificate to access a Web site.
Well that's because TLS client certificates are not generally implemented on web servers even if
they are it's all implemented under the hood.
So in normal user don't have to generate and manage certificates manually so that was the final piece
about client certificates this whole infrastructure including the CA the servers the people and the
process of generating distributing and maintaining digital certificates is known as public key infrastructure
or PKI finally let me clear up something before you leave I've been using the analogy of a key and
law for private and public keys.
So just remember private keys have the word ‘key’


******************************************************SUMMARY COMPLETD FOR TLS*****************************************************************************************************************


56) TLS in k8's

Server certs, CA certs and client certs , if client and server exchange cert it becomes mTLS
All communication between all the major components of the cluster must be secure. 
So components within the Cluster - need to ensure that they use client and server cert depedning on who they are.
NOTE: the connection of the user to the kube-apiserver must also be secure

1) Kube-api-server - Server . has cert and key - apiserver.crt and apiserver.key
2) Etcd - server 
3) Kubelet also expose API endpoint svc- so they will also have crt and svc
4) us -administrators - clients - require admin.crt and admin.key to communicate 
5) kube-scheduler talke to API server - client 
6) kube-controller-manager - client
7) kube-proxy - client needs cert to authenticate to kube-api-server
8) kube-api-server acts as a client when it tries to interact with etcd and kubelet server so needs cert (can use previous ones) 


57) Cert creation in k8's
FOr creation of certificates we have many tools available -> Easyrsa, Openssl, Cfssl 
# certificate creation for CA 
**  openssl genrsa -out ca.key 2048 
**  openssl req -new -key ca.key -subj "/CN=KUBERNETES-CA" -out ca.csr 
Now we sign the certificate using openssl x509 command, since above is the CA , so we self sign it
** openssl x509 -req -in ca.csr -signkey ca.key -out ca.crt 

Now we will use this CA to sign all the certifcates 

for Admin user

** openssl genrsa -out admin.key 2048
** openssl req -new -key admin.key -subj "/CN=kube-admin" -out admin.csr  (this generated a certificate signing request for admin user)(cn can be anything)
Now we create a cert by providing the ca key pair
** openssl x509 -req -in admin.csr -CA ca.crt -CAkey ca.key -out admin.crt


Go through this again ????????????????????????????

58) What to do with the Admin certificate 
we can use this certificate instead of a username and password in the rest API call
curl https://kube-apiserver:6443/api/v1/pods --key admin.key --cert admin.crt --cacert ca.crt 

OR 

move all the values inside the kubeconfig.yaml file (This gets generated when we are create Openshift cluster automatically with kube-admin username)
Here we specify the API server end point details, client cert and client-key 

NOTE :: See how users like citiqa etc are getting added in kubeconfig automatically 

Note -->> Truested CA cert is added in all the componenets

Kubelet certificates will be named after their nodes, 

59) How to check the certificates 
go to the static folder path -> cat /etc/kubernetes/manifests/kube-apiserver.yaml
Here you get the certificates values 

Command -->> openssl x509 -in <certname>.crt -text -noout 


60) Certificates API 
The admin user has it's certificates and Key, now new users come and need access to the cluster, 
Now in order to sign the CSR for a new person, we use the CA server - since we generated it ourselfes - the master node is the CA server
K8's has a built in Certificates API which can automatically sign the CSR's for new users


Once csr is generated by the user 
Adminitsrators can see it and approve it 
kubectl get csr
kubectl certificate approve <name-of-csr>

All certificate related options are managed by Kube-controller-manager 
and controller manager u have 2 options -> --cluster-signing-cert-file and --cluster-signing-key (ca.key)


61) Kubeconfig 

curl https://my-kube-playground:6334/api/v1/pods --key admin.key --cert admin.crt --cacert ca.crt
This request get's validated by API server and we get the response 

If we use kubectl --> we move the file to a kube-config file -->> by default k8's look at a file under dir -> $home/.kube/config  (see path in Openshift)
and we just do kubectl get pods - and don't specify above parameters as we have moved everything inside the kube-config file 

Clusters - Prod, Development , 
Context - Admin@prod, users@development 
Users - Admin, users

Here we are adding which users can access what, we are not creating new users.

https://my-kube-playground:6334/api/v1/pods and is goes in cluster section also --cacert ca.crt  goes below the cluster 
--key admin.key --cert admin.crt - this goes in users section

command -->.Kubectl config view to see the Data.

62) API groups 

curl https://kube-master:6443/version 

curl https://kube-master:6443/api/v1/pods


K8's API is grouped into multiple groups named 
1) /api
2) /apis
3) /version
4) /metrics
5) /healthz
6) /logs

API responsible for cluster functionality are categorised into 2-
/api (core group) and /apis (named group)

- In the core group all the core functionality exists, (ns, pods, rc, nodes, bindings, PV, configmaps, secrets_
- In the named API group , - they are more organised and going forward all the new functionality will be in named API groups, - /apps, /etensions, /networking.k8s.io, /storage.k8s.io , /authentiction.k8s.io, /certificates.k8s.io

Each API groups have resources and each resource has some actions that can be perfomed on them - create, list, get , update , watch 

********MAGIC*******

STart kubectl proxy service

command -> kubectl proxy
then do command -> curl https://localhost:8001 -k (kubectl proxy will fetch credentials from kube-config)

NOTE : kube-proxy != kubectl proxy (http proxy service created by kubectl utility to access the kube-api-server)

63) Once a team gains access, what can they do is controlled by Authorisation 
  
Authorisation mechanism supported by k8's --> RBAC | Node Authorisation | ABAC | Webhook 

Webhook means we want to manage Authorisation by 3rd party, for that we have --> Open Policy Agent 
RBAC -> we create role object by adding rules , For core group we can leave the API group section as Blank, for other we specify the APi group 
Now we create a RuleBinding Object where we link that user to the sepcific role 

Roles and RoleBindings are namespaced.
Similarly we have cluster role and ROle Bindings for --> cluster-wide resources like Node , PV, CSR, namespaces etc

To get the full list of resources for namespaced and CLuster role- use the below command-->

* kubectl api-resources --namespaced=true 
* kubectl api-resources --namespaced=false  (This will give cluster-wide-resources) 

Note: IF you use CLuster role to give access to pods - then users can have access to all pods in all namespaces (i.e we can use cluster-roles to create access for namespaced resources)

*************IMAGE NAME ******************************************

image: registry/userAccount/Image/repository -->> docker.io/nginx/nginx  

Google registry is at gcr.io -->> image: gcr.io/kubernetes-e2e-test-image/dnsutils 

Private repo -> private-resistry.io/apps/internal-app 

Now login can be done by using creating Image pull secret -> (secret is of type docker-registry)
oc create secret docker-registry nfr-dockercred --docker-server="https://docker.io" --docker-username="traydstreamcicd"​​​​​​​ --docker-password="########"


64) Security context 

Secuirty settings (running as a user-id etc) , if u set them at pod level - they are cary forwarded to container level
Here we add ssc in Openshift using above command,
IF configured on both container and pod, then setting will override and continer level will be used 

securityContext:
  runAsUser: 1000 (this can be added to pod-definition file) 

By default containers run on default Service account and since some containers require special permissions - we add anyuid to them by using above command.

65) Network policies are used to restrict traffic between pods (Engress and Ingress traffic)

(((Missed network Policies and developing network Policies)))

66) Storage in Docker (Docker Storage driver and local file system) 

When you install Docker on a host - it creates a folder 

/var/lib/docker 

which has
- aufs
- containers
- image
- volumes 

Copy on write mechanism means when i mount a vol on my local machine to a docker container and if you make changes to the source code on the container , then the source code will be changed
on container and not on the image , unless you rebuild the image using docker build command 

docker volume create data_volume

--> Above command will create a data_volume folder under -> /var/lib/docker/ 
Now u can mount this vol under the docker container read write layer using -v option -->>> docker run -v data_volume:/var/lib/mysql mysql (image-name)  (Volume mounting)

IF you don't create vol first and directly do docker run -v data_volume1:/var/lib/mysql mysql (image-name), so data_volume1 will be created under /var/lib/docker/volumes automatically  (volume mounting)

We can also mount a specific data path and it is called Bind Mounting -->> docker run -v /data/tmp/volume:/var/lib/mysql mysql

Note: -v is outdated option, we use the mount option

docker run --mount type=bind,source=/data/tmp/volume,target=/var/lib/mysql mysql

**Docker uses Storage drivers to enable layered Arcitecture,** 
So who is responsible for doing all of these operations, maintaining the layered architecture, creating
a writable layer, moving files across layers to enable copy and write, etc? It's the stories Drivers.So Docker uses stories drivers to enable layered architecture.
Some common storage drivers are --> **aufs, zfs, btrfs, Device mapper, Overlay, overlay2**

Selection of storage driver depends on the underlying OS used, for eg - with Ubuntu Default Storage driver is aufs. Docker uses best storage drivers based on OS automatically.

67) Volume driver Plugins 
Volumes are not handled by Storage drivers, they are handled by Volume driver plugins
**The default volume driver plug in is local.**
The local volume plug in helps create a volume on the Docker host and store its data under the /var/lib/docker volumes directory.
other volume driver plugins --> azure file storage | convoy | DigitalOcean | gce-docker | NetApp | RexRay | Portworx 

When you run a docker container, u can use the volume driver - eg -->

docker run -it --name mysql --volume-driver rexray/ebs --mount src=ebs-vol,target=/var/lib/mysql mysql 

68) CSI (container storage interface) 
All the code to run with docker was embedded in k8's source code , but now new container run-times coming in like rkt and cri-o , it was important to extend support to them.

That's how CRI came in picture (Container run time interface) 
CRI is a standard that defines how an orchestration solution like k8's will communicate with Container run time like Docker, so in future if any Container run time engone is developed they can follow CRI standars without talking to k8's coders.

Now to extend support to diff networking solutions CNI (container networking interface was introduced), now any new Networking vendors could simply develop their plug in based on CNI standards and make their solution wwork with k8's , eg --> weaveworks, flannel, cilium 

Similarly CSI was developed to support multiple storage solutions, with CSI you can write your own drivers to work with k8's 

CSI is not a k8's standard - rather it is a universal standard, and if implemented allows any container orchestration tool to work with any storage vendor with a supported plug in.
Currently k8's , mesos, cloudFoundary are on board with CSI.

68) Volumes/PVc's/Storage classes
Volume storage options
- host-path 
- NFS
- GlusterFS
- aws ebs
- azure files

PV and PVC
A persistent Volume is a cluster wide pool of storage volumes configured by an administrator to be used by users deploying applcations on the cluster, users can now select storage from this pool by using persistent volume claim 

accessMode defines how a volume is mounted on the host--> ReadWriteOnce, ReadWriteMany, ReadOnlyMany
In traydstream we are using awsElasticBlockStore in AWS openshift with ReadWriteOnce access mode

We can't use normal vol as those vol needs to be made same on every node and a change made on a paticluar node has to be made on all nodes.

Every PVC is bound to a single PV

Storage class 
You first create a disk on azure/aws and then create a PV of same size, - this is called STatic provisioning
but a better way to do it is create Storage class and create PVC, it will automatically create PV ,
you add a provisioner in the storage class - kubernetes.io/aws-ebs
and in the pod-definition file we just specify the PVC 

SO when we create a PVC, the storage class will use the provisioner to create a disk and then create PV and once PV is created it will get bind with PVC.
So automatically disk will get created 

69) Networking 

# command --> ip link (list and modify interfaces on the host)(it will list the interfaces on the host - almost values as ifconfig but will also tell which interface is down and which is up) 
# command --> route (it will give you existing routing table configurations) 
# command --> ip route add 192.168.2.0/24 via 192.168.1.8 (this will add a route and display output in the route command) (this adds entry in the routing table )

By Default in linux packages are not forwarded from one interface to another 
Now whether a system can forward packets to another network - it is governed by entry in cat /proc/sys/net/ipv4/ip_forward  - value is 1 , then the pings will go through
Note: Same value should be present in cat /etc/sysctl.conf

# command --> ip addr (to see the IP address assigned to the interfaces) 
# ip addr add 192.168.1.10/24 dev eth0 (this command is used to set IP address on a interface) 

In ordeer to persist above changes, values should be set in /etc/network/interfaces file
ip route add 192.168.1.0/24 via 192.168.1.0 is used to add values in the routing table 

70) DNS

cat >> /etc/hosts
192.168.1.8  db

* cat /etc/resolv.conf --->>> this gives us the value of the DNS server
IF entries are present in /etc/hosts as well as DNS sever, then preferance would be given to etc/hosts ... but the order can be changed



71) CNI is a standard that defines how networking programmes should be developed to solve networking challenges in a container run-time env, the programmes are called plugins.
CNI defines how a plugin should be developed and how container run time's should invoke them .

weave plugin 
Docker does not implement CNI , rather it has own set of standards CNM(docker network Model)

kubelet - 10250
api-sercer - 6443
kube-scheduler - 10251
kube-controller manager - 10252
node services --?> 30000-32767
etcd - 2379
for multiple masters - need 2380 open so etcd can talk to each other 

72) Pod networking

Every pod should be able to reach every other pod all all nodes without NAT
Kubelet is responsible for creating containers on every nodes, kubelet has the cni configuration passed as an option
--cni-conf-dir = /etc/cni/net.d
--cni-bin-dir= /etc/cni/bin

The kubelet that looks at the CNI configuration passed as a command line argument when it was run and identifies
our scripts name.

It then looks in the cni's bin directory, defined our script and then executes the script with
the ADD command and the name and namespace ID of the container.
And then our script takes care of the rest.


73) CNI in k8's
CNI defines resposibiities of container run time and also the responsibilty of plugins

kubelet.service
--network-plugin=cni
--cni-bin-dir= /etc/cni/bin   -- it has all the plugins as executables 
--cni-conf-dir = /etc/cni/net.d -- this has set of configuration files, this is where kubelet looks to find which pkugin needs to be used. (in this u define range of IP addresses that would be assigned to pods) 

How are the pods assigned IP-

CNI plugin assigns the IP to pods, in the kubelet
CNI comes with 2 plugins -- host-local(manages locally)  and DHCP (manages ip on server)

cni plugin section --> cat /etc/cni/net.d/net-script.conf

this has a section - ipam where we define whether we use host-local or dhcp

weaveworks does it  by assigning IP in range - 10.32.0.0/12  for entire network

74) Service networking

kube-proxy sees the svc crated , it used ip-tables rules 

service range is specified in kube-api-server -> --service-cluster-ip = 10.0.0.0/24

range for pods and svc should't overlap



































*********************************************************************creating users in Openshift********************************************************************************************************
We are creating users in OpenShift by using htpPassword as identity provider 
Creating users in Openshift
htpasswd is used to create and update the flat-files used to store usernames and password for basic authentication of HTTP users.
- Creating a user for Support team having read only access 
1) sudo apt install apache2 or yum install httpd-tools
2) Create user name and hashed password
htpasswd -c -B -b </path/to/users.htpasswd> <user_name> <password>
htpasswd -c -B -b users.htpasswd  ocadmin 10ef83058804655fbd379f4d66ed571f
htpasswd  -B -b users.htpasswd  supportuser 9a5fcb77d00ef6a7f1bf8c901412694a

3) Creating the HTPasswd Secret
Let we wanna to use the HTPasswd identity provider, we must define a secret that contains the HTPasswd user file. Let create an OpenShift Container Platform Secret that contains the HTPasswd users file
# oc create secret generic htpass-secret --from-file=htpasswd=</path/to/users.htpasswd> -n openshift-config
# oc create secret generic htpass-secret --from-file=htpasswd=users.htpasswd -n openshift-config

4) Create a custom resource for an HTPasswd identity provider
# vi htpasswd.yaml

apiVersion: config.openshift.io/v1
kind: OAuth
metadata:
  name: cluster
spec:
  identityProviders:
  - name: my_htpasswd_provider
    challenge: true
    login: true
    mappingMethod: claim
    type: HTPasswd
    htpasswd:
      fileData:
        name: htpass-secret

5) Appply the file
# oc apply -f htpasswd.yaml

6) Now try to login and fetch the pods and nods
# oc login -u ocadmin
# oc whoami
# oc get nodes

Since no role is assigned to user ocadmin, this user does not have privileges to access cluster resources

6) Let's configure cluster role and rolebinding
# oc adm policy add-cluster-role-to-user cluster-admin ocadmin --rolebinding-name=cluster-admin

We will create a read only access to the support team 
# oc adm policy add-cluster-role-to-user cluster-reader supportuser --rolebinding-name=cluster-reader

7) If you want to give a user specific access to a paticular project 

# oc project dev-project1
# # adm policy add-role-to-user cluster-admin devuser -n dev-project1

8) Test the user ocadmin access

# oc login -u ocadmin
# oc get nodes
# oc get projects

9) Test the support user access

# oc login -u devuser
# oc get nodes
# oc get projects

10) Log in as the ocadmin / kubeadmin user and list the current users and identity.

# oc get users
# oc get identity

11) How to delete the user (devuser)
To delete user
# oc delete user devuser

12) Delete the identity for the user
# oc delete identity my_htpasswd_provider:devuser


*********************************************************************************end of users creation in Openshift******************************************************************************************
















______________________________________________________________________________DOCKER____________________________________________________________________

1) Container is a way to package application with all dependencies and configuration, and it is portable just like an artifact 
2) Container has own isolated env(packaged with all needed configuration) - where all the dependencies get installed and added, basically docker doesn't install anything on the server
3) What is a container --> Layers of images stacked together, base image is mostly Linux(small size)
4) Only diff layerrs will get downloaded when u download a new version
5) docker ps will give u running containers
6) Diff b/w Docker and Virtual Machine (like oracle Virtual Box)
- Operating system has 2 layers - 

Applications > OS kernel (layer1) > Hardware (layer2)
Kernel is part that commuicates with hardware components like CPU and memory etc, Applications run on kernel layer
eg-> Like Linux is a kernel and diff Distributions are there (ubuntu,red-hat etc)
Docker and VM both are virtualisation tools , 

Docker virtualises Applications layer and uses kernel of the Host
VM virtualises the complete OS, i.e the VM boosts up it's own kernel

Size of docker is very small and it's speed is very fast. 
Docker is compatible -> VM of any OS can run on any OS host

Note: image is an artifact which has all dependencies packed while container is the runninge env of the image

7) Basic commands 

Container adds port number, env configs and a designated file system to the running image by providing an env

Pulling an image --> docker pull redis 
command -> docker images
Now in order to connect to the redis application, i need to run the container >> command > docker run redis
command > docker ps --> It will list all running containers
Command > docker run -d redis -> It runs container in a detached mode ----> output will be the ID of the container
command> docker stop <container-id>
command > docker ps -a >>> It lists all running and stopped docker containers
command > docker run redis (it pulls image and starts it - so does 2 things)

docker ps - will give u the port at which container listens also 

###Container port vs Host port###
Multiple containers can have same port running, but the port binded to them (host port) will be different

Now we can add binding of the host port to the container port while running them >>>

Command >> docker run -p<host-port>:<container-port>, docker run -p6000:6379 redis

Now in output of docker ps command, u will see 0.0.0.0:6000-->6379/tcp

-p is used to bind the port on local machine to the port on the container

* we can set explicitly the name of the container 
docker run -p3000:6379 --name redis-older redis:4.0  (so basically we have given an explicit name)

docker start is used with containers and not images, docker run is used with images  


8) Debugging COntainers
# docker logs <container-Id>
# docker logs <container-name>
# docker exec -it <containe-id> /bin/bash
# docker exec -it <containe-name> /bin/bash
We have virtual file system inside the docker container, i.e the host Storage system is different

 

Traydstream logs -> tail -300f ~/.ts/admin/log/gtxadmin.log


9) Developing with Containers

*****Docker Network*********
Docker creates an Isolated Docker Network where the containers run in. Hence, containers would be able to talk to each other with just their names, without using local host etc.
so if we connect from outside the docker network - we use localhost:<port-no>

commmand >> docker network ls 
we get - bridge, docker_default, host and none... with drivers as bridge,bridge,host and null and all have scope as local 
in Traydstream we have bridge, gtx-admin_default, host and none.. with drivers as bridge,bridge,host and null and all have scope as local


Command to create a network ->> docker network create mongo-network (name) (it will give bridge driver and scope local)
# docker run -p 27017:27017 -d -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_USERNAME=pass --name mongodb --net mongo-network mongo 

local host is basically 0.0.0.0 

10) Docker compose

All the containers that needed to be run - we can write the run commands in a structured way in Docker-compose 


version: '3'  (docker-compose version)
services:     (these are the list of continers)
   mongodb:   (container name)
     image: mongo 
     ports: 
      - 27017:27017 (host port is mapped to the container port- Host:Container)
     environment:
       - username: jajaa
   mongoexpress:
      image:
      --
      --
      --
      

# Network configuration or specifying the network is not there in Docker compose, that is Docker compose will take care of creating a common network for all the listed containers

# command to start the docker compose file 
------>>>> docker-compose -f <compose-fie> up (up is used to start all the containers)
Output will say that it created a network and it will run all the commands inside that network

Note: if in docker-compose one container depends on the other we can set that waiting logic or add the command named depends on
------>>>> docker-compose -f <compose-fie> down, this will stop all the containers
SO it will stop the containers and it will also remove the network


***************************Building own images******************************************************

* Blue-print for building images is called a DockerFile 
* We can also define env variables inside a DockerFile also , but it's better to do it at compose level
* all the commands inside the docker file will apply to the container env



*******************syntax of docker-file***************************************************************************************************************

FROM node:13-alpine       (<base-image>)
ENV name=harkirat \
    game=tennis 
    
RUN mkdir -p /home/app             (RUN helps u to execute any kind of linux command) (Directory will live inside the container and not on the host)
COPY . /home/app        (COPY command gets executed on the host, . means source- i.e we are copying commands from the host machine inside the container, we cannot use RUN cp - it executes inside cont)
CMD ["node","/home/app/server.js"}   (CMD get's executed everytime a container is run, so command will be node /home/app/server.js) (this will run inside the container)  (we are able to execute this node command as base image  is of node and we don't have to install it again)

**********************************************************************************************************************

Note: we can have multiple RUN commands but CMD is an entrypoint command 

Now if you add ENTRYPOINT command in Docker file - this is generally a script that get's appended to CMD command, 

eg --> ENTRYPOINT ["harkirat.sh"}
       CMD[ "node"]    so command at startup will be --> node harkirat.sh

Note: Name of Dockerfile has to be DockerFile 

# Now command to build an image --> we need to give name and tag to newly created image (-t is used for tagging, after that we need to specify the docker file)

---->> docker build -t my-app:1.0 .  (. because we have dockerfile in same dir) 
# docker build -t means we are building and tagging the image together 

# command to delete image -->> docker rmi <image-name> 
# command to delete container --> docker rm <container-name or id>

Note: some containers do not have bash so we might need to exec using sh(shell)
# how to check env varibles for that specific container --->>> do exec inside the container and run command --->> env

**********creating private repo and pushing the image there*****************************************************************
1) authenticate to repo
2) Then use docker push to push the image after it has been tag 

Image-naming in dockerregistry -->>> registryDomain/imageName:tag 

for docker hub we do -> docker pull redis:4.1 , but actually it is this -> docker pull docker.io/library/redis:4.1

# DOcker build and tag can be used as separate commands 
      
### docker tag basically renames the image which we build 

# docker push serverDomainname:tag 

# command -> docker tag <name-of-image-when-built> <re-named-image-including server address>:tag
After tag we do docker push

# Now after all images have been tagged and push we can use Docker-compose to fetch the latest images and deploy them on the server 

- For fetching the image from a private repo - we would need a Docker login first, but in case of k8's we create an image pull secret

*******************************DOCKER VOLUMES**************************************************************************************************

1) They are used for Data Persistence in containers or other Stateful Applications
2) So Folder in a host file system is mounted into the virtual file system of Docker
3) So when container writes on virtual file system (/var/lib/mysql/data it gets written to host file system /home/mount/data ) and vice versa

# 3 types of Docker Volumes 

1) Host Volumes 
docker run -v <host-vol>:<container-vol-path>
2) Anonymous Volumes ---> there dir on the host is created by Docker itself 
docker run -v /var/lib/mysql/data (container vol) 
on host --->> it will automatically be /var/lib/docker/volumes/random-hash/data
3) Named volume 
docker run -v name:/var/lib/mysql/data (here we speicfy the volume name, name can reference the path) , the name will just refrence the Directory

IN production we use Named volumes 

# In docker compose 

services:
   mongodb:
      image:
      ports:
        - 
      volumes:
        - db-data:/var/lib/mysql/data
        
volumes 
   db-data (here we list all the vol which we want to mount inside the dir) 
     driver: local (docker needs to create a storage on a local file system)
     
now we will add it in docker-compose

volumes:
 - mongo-data:/var/lib/eeehxgc/             (named volume on host:path on container)

Now this named volume in Linux system will be located at /var/lib/docker/volumes 

Each volume will have it's own hash - anonymous volumes 

Our volumes will have hash and name appended.

NOTE : See how we do it in Traydstream


1) Command -> docker run -it -d ubuntu
This will keep running the container in Daemon mode -( -d is for daemon)
-it is for i->interactive and t is for tty
-d means Daemon mode and it will send it to the background

Now above command will send it to a detached mode and if you want to connect to that container we have the command->
docker attach <containmer-id>
you will be re-directed to the container shell in interactive mode

------------Docker important commands ------

1) docker exec -ti <container-name> command.sh
2) docker logs -ft <container-name>
3) docker-compose up
4) docker pull image
5) docker [start] [stop] container_name


DOCKER PRUNE ??


   











































