# Gitlab Terraform Infrastructure


## Overview

This repository provisions Gitlab infrastructure on AWS using Terraform. It is modular, environment-driven, and supports scalable, reusable patterns for EC2, IAM, and networking.

## Environments

- `env/dev/` and `env/prod/` contain environment-specific variable files.
- Use `main.tfvars` for main configuration and `state.tfvars` for remote state or backend settings.

## Modules

- `modules/ec2/`: Provisions EC2 instances, security groups, and related resources. Ingress rules are parameterized for environment flexibility.
- `modules/iam/`: Manages IAM roles, instance profiles, and policies for agents and workers.

## Usage

1. **Initialize Terraform:**
	```sh
	terraform init
	```

2. **Plan for a specific environment:**
	```sh
	terraform plan -var-file=env/dev/main.tfvars
	```

3. **Apply for a specific environment:**
	```sh
	terraform apply -var-file=env/dev/main.tfvars
	```

4. **Switch to production:**
	```sh
	terraform plan -var-file=env/prod/main.tfvars
	terraform apply -var-file=env/prod/main.tfvars
	```

## Customization

- Edit `env/dev/main.tfvars` or `env/prod/main.tfvars` to change instance types, AMI IDs, ingress rules, and IAM actions.
- All security group rules and most settings are parameterized for maximum flexibility.

## Best Practices

- Use environment variable files for all overrides.
- Keep modules generic and reusable.
- Add version pinning for providers and modules (to be added).
- Use `terraform fmt` and `terraform validate` before commits.

## Outputs

- Key resource IDs and names are output for use in automation or as dependencies for other modules.

## Folder Structure

```
.
├── Makefile
├── data.tf
├── env/
│   ├── dev/
│   │   ├── main.tfvars
│   │   └── state.tfvars
│   └── prod/
│       ├── main.tfvars
│       └── state.tfvars
├── locals.tf
├── main.tf
├── modules/
│   ├── ec2/
│   │   ├── data.tf
│   │   ├── ec2.tf
│   │   ├── outputs.tf
│   │   ├── route53.tf
│   │   ├── securityGroup.tf
│   │   └── vars.tf
│   └── iam/
│       ├── agent_iam.tf
│       ├── locals.tf
│       ├── outputs.tf
│       ├── variables.tf
│       └── worker_iam.tf
├── outputs.tf
├── provider.tf
├── readme.md
└── variables.tf
```