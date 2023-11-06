# Udacity - Microservices at Scale using AWS & Kubernetes

## How to run

### 1. Create images for analytics API

- Create `Dockerfile`.
- Create `buildspec.yml`.
- Push the project to Github repo.
- Create CodeBuild Pipeline.
- Get the Image URI.

### 2. Configure help postgresql and deployment file

- Create EKS cluster and node group.
```bash
aws eks create-cluster --region us-east-1 --name lqdisme-project3 --kubernetes-version 1.28 \
   --role-arn arn:aws:iam::758716314495:role/eksClusterRole \
   --resources-vpc-config subnetIds=subnet-0bac5b66fd0ddcd40,subnet-0a7cce34bc524e1ff,securityGroupIds=sg-00919a27a877783bd
```
- Add the cluster to kubectl config.
```bash
aws eks update-kubeconfig --name lqdisme-project3
```
- Install helm chart postgresql and seed the data in db/folder.
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install postgres-svc bitnami/postgresql --set primary.persistence.existingClaim=pvc1 --set volumePermissions.enabled=true
```
- Create deployment file to deploy app and service.
- Create db config map file and db secret file to save environment variable and database password.
```bash
PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5433 < db/1_create_tables.sql
PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5433 < db/2_seed_users.sql
PGPASSWORD="$POSTGRES_PASSWORD" psql --host 127.0.0.1 -U postgres -d postgres -p 5433 < db/3_seed_tokens.sql
```
- Deploy these file using kubectl.
```bash
kubectl apply -f deployment/db-configmap.yml
kubectl apply -f deployment/db-secret.yml
kubectl apply -f deployment/analytics-api.yml
```

### 3. CloudWatch
```bash
ClusterName=lqdisme-project3
RegionName=us-east-1
FluentBitHttpPort='2020'
FluentBitReadFromHead='Off'
[[ ${FluentBitReadFromHead} = 'On' ]] && FluentBitReadFromTail='Off'|| FluentBitReadFromTail='On'
[[ -z ${FluentBitHttpPort} ]] && FluentBitHttpServer='Off' || FluentBitHttpServer='On'
curl https://raw.githubusercontent.com/aws-samples/amazon-cloudwatch-container-insights/latest/k8s-deployment-manifest-templates/deployment-mode/daemonset/container-insights-monitoring/quickstart/cwagent-fluent-bit-quickstart.yaml | sed 's/{{cluster_name}}/'${ClusterName}'/;s/{{region_name}}/'${RegionName}'/;s/{{http_server_toggle}}/"'${FluentBitHttpServer}'"/;s/{{http_server_port}}/"'${FluentBitHttpPort}'"/;s/{{read_from_head}}/"'${FluentBitReadFromHead}'"/;s/{{read_from_tail}}/"'${FluentBitReadFromTail}'"/' | kubectl apply -f -
```