# Introduction
This repository contains terraform code that used to create and manage the azure infrastructure.

# Getting Started
1. Install terraform in local system
2. Configure the azure subscription is going to use.
3. Create a backend storage in azure to save the terraform state file.

# Folder structure
Since we have to manage different environments, `tfvars` and backend configuration of each environment
are kept in a different folder

Folder structure as follows:

```
.
+-- environments
|   +-- qa
|	|	+-- backend.tf
|	|	+-- terraform.tfvars
|   +-- uat
|	|	+-- backend.tf
|	|	+-- terraform.tfvars
+-- modules
|	+-- network
|	|	+-- main.tf
|	|	+-- variables.tf
|	+-- resource-group
|	|	+-- main.tf
|	|	+-- variables.tf
+-- main.tf
+-- variables.tf
```

# Running terraform

### Initializing backend

```terraform
terraform init -reconfigure -backend-config="environments/<environment>/backend.tf"
```

### Dry Run and creating a plan file
```terraform
terraform plan -var-file="environments/<environment>/terraform.tfvars" -out="environments/<environment>/output.tf"
```

### Applying changes
```terraform
terraform apply "environments/<environment>/output.tf"
```