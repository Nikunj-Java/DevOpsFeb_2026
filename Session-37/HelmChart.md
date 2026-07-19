# What is Helm Chart ?
Helm is package manager for Kubernetes, Similar to:
    - apt for ubuntu
    - yum for RHEL
    - npm for Node.js
    - pip for Python
- A helm Chart is a package collection of Kubernetes manifest(YAML files) that can be installed , upgraded or removed as a single unit

## Without Helm
- suppose you want to deploy a WordPress Application
- you might need to create
```
Deployment
Service
ConfigMap
Secret
PersistentVolume
PersistentVolumeClaim
Ingress
HorizontalPodAutoscaler
```
- That's Many YAML files to manage mannually

## With Helm
```
helm install wordpress
```
- helm will automatically create all require resurces of kubernetes togather

## Helm Architecture
![Helm Chart](<images/Helm Chart.png>)

## Structure of Helm Chart
```
mychart/

├── Chart.yaml
├── values.yaml
├── charts/
├── templates/
│     ├── deployment.yaml
│     ├── service.yaml
│     ├── ingress.yaml
│     ├── configmap.yaml
│     └── _helpers.tpl
└── README.md
```
## Helm Installation
[Helm Installation](https://helm.sh/docs/intro/install/)
```
HELM_BUILDKITE_APT_KEY_ID="DDF78C3E6EBB2D2CC223C95C62BA89D07698DBC6"

sudo apt-get install curl gpg apt-transport-https --yes

curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey > "${TMPDIR:-/tmp}/helm.gpg"

# Ensure that the key ID matches to prevent a repository compromise from establishing an attacker controlled key
if [ "$(gpg --show-keys --with-colons "${TMPDIR:-/tmp}/helm.gpg" | awk -F: '$1 == "fpr" {print $10}' | head -n 1)" != "${HELM_BUILDKITE_APT_KEY_ID}" ]; then echo "ERROR: Unexpected Helm APT key ID: potential key compromise"; exit 1; fi

cat "${TMPDIR:-/tmp}/helm.gpg" | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://packages.buildkite.com/helm-linux/helm-debian/any/ any main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

sudo apt-get update
sudo apt-get install helm
```
### Check the Helm Version
```
helm version
```
### Create an Application
```
helm create myapp
```
- it will create myapp folder in your root directory
![alt text](images/image-4.png)

### Create Deployment, Pod and Service
```
helm install myapp ./myapp/ --debug
```
### Check the output
```
kubectl get deployment
kubectl get pods
kubectl get service
```

### Remove 
```
helm uninstall myapp 
```