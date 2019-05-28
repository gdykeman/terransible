# TerrAnsible

Ansible and Terraform - using Ansible as the orchestrator

## Requirements

- Each playbook in the respective cloud assumes an extra variable file definition: (ex: extra_vars.yaml)

- The backend configuration is kept in Amazon S3

- The playbook requires a tag to determine state (present|absent)

# Setup specific to each cloud
- Define the extra_vars.yaml file passed in using `-e @extra_vars.yml`

### Amazon Web Services
```
---
AWS ACCESS CONFIGURATION:
aws_access_key: "<access-key-here>"
aws_secret_key: "<secret-key-here>"

AWS BACKEND CONFIGURATION:
aws_bucket: "<bucket-name>"
aws_key: "<key-name>"
aws_region: "<region>"
```

### Google Cloud Platform
```
---
GCP ACCESS CONFIGURATION:
gcp_project_id: "<gcp-project-id>"
gcp_cred_path: "<path-to-credential-file>"

AWS BACKEND CONFIGURATION:
aws_access_key: "<access-key-here>"
aws_secret_key: "<secret-key-here>"
aws_bucket: "<bucket-name>"
aws_key: "<key-name>"
aws_region: "<region>"
```

# Provisioning via Ansible and Terraform
2. Ensure that you are in the appropriate directory respective to the cloud you are provisioning into. (I.E. - *_ansible where * is the cloud name)
```
    ansible-playbook ansible_terraform.yaml -e @extra_vars.yaml -t present
```

# Teardown via Ansible and Terraform
1. Just as before, ensure that you are in the appropriate directory respective to the cloud you are tearing down. (I.E. - *_ansible where * is the cloud name)
```
    ansible-playbook ansible_terraform.yaml -e @extra_vars.yaml -t absent
```