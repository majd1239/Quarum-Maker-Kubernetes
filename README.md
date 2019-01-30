This fork enables Quorum-Maker to run on Kuberenetes with minimal effort. You just need to build the container from the docker image and you can deploy it directly to K8s. Provided is two deployments templates that I used to deploy on gcloud kuberenetes.

The master-node.yaml is a single worker deployment that provides a persitant volume for the bootstrapping node. Upon boot up, the nodemanager port and the grpc port are exposed through a load balancer.

The slave-nodes.yaml is a DeamonSet multi-worker deployment that can be used to scale the network. It launches a deployment for every node in your pool and does not allow multiple replicas on the same node. Optionally you can add persistance storage as well. Before deployment, you need to manually enter the bootstrapping node external ip in the args field so the nodes can join the network. All the requests are load balanced to a single external ip.
