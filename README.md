<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/ee73a6ea-3c21-40a4-a740-8472f9f70748" />



## AWS | Backup and Restore ( Migration )  
Migration is the process of moving applications, data, and infrastructure between environments with minimal downtime and preserved data integrity. In Kubernetes, tools like Velero are used to back up and restore cluster resources, enabling reliable workload transfer between clusters. MinIO is commonly used as an object storage backend to securely store Velero backups. The Velero UI provides a visual interface to monitor, manage, and restore backups easily during migration.



🎯 Architecture Overview
```
✅ VPC containing Public and Private Subnets
✅ Internet Gateway for outbound internet access
✅ NAT Gateway in the public subnet for private subnet egress
✅ Elastic Kubernetes Service using a Launch Template
✅ EC2 instances in the ASG, scaling in/out automatically
✅ Private resources (like RDS, caches) in the private subnets
```


🧱 Features
```
✔ Fully automated provisioning with Terraform
✔ High availability using multiple subnets in different Availability Zones
✔ Secure connectivity between Application and RDS
✔ Configurable environment variables for database credentials
✔ Easy to extend for other JSON data source
```



🚀 Deployment Options
```
terraform init
terraform validate
terraform plan -var-file="template.tfvars"
terraform apply -var-file="template.tfvars" -auto-approve
```

