# AWS Infrastructure provisioning with Terraform

This project provisions a basic AWS infrastructure using [Terraform](https://www.terraform.io/). It includes:

- A Virtual Private Cloud (VPC)
- A security group for Jenkins
- An EC2 instance
- An S3 bucket
- A DynamoDB table

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) installed
- An AWS account
- AWS credentials configured locally (via environment variables or AWS CLI)

## Resources Created

### 1. **VPC**
- **CIDR Block**: `172.16.0.0/16`
- **Name**: `EC2_Instance_creation`

### 2. **Security Group**: `JenkinsSG2`
- **Ingress Rules**:
  - TCP on port `8080` (for Jenkins)
  - TCP on port `22` (for SSH)
- **Egress Rules**:
  - All outbound TCP traffic allowed
- **Tag**: `my-ec2-instance`

### 3. **EC2 Instance**
- **AMI**: `ami-0a695f0d95cefc163` (Ubuntu 22.04 in `us-east-2`)
- **Instance Type**: `t2.micro`
- **Key Pair**: `SaheedKey pair`
- **Security Group**: `JenkinsSG2`
- **Tag**: `my-ec2-instance`

### 4. **S3 Bucket**
- **Name**: `saheed-tf-test-bucket`
- **Tags**:
  - Name: `My bucket`
  - Environment: `Dev`

### 5. **DynamoDB Table**
- **Table Name**: `GameScores`
- **Hash Key**: `UserId` (String)
- **Range Key**: `GameTitle` (String)
- **Read/Write Capacity**: 20/20
- **TTL**: Disabled
- **Tags**:
  - Name: `dynamodb-table-1`
  - Environment: `production`

## Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Validate the configuration:**
   ```bash
   terraform validate
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply
   ```

   > Note: You will be prompted to confirm before resources are created.

5. **Destroy the infrastructure (when done):**
   ```bash
   terraform destroy
   ```

## Notes

- Make sure your AWS credentials are correctly configured.
- Always double-check region and AMI ID compatibility.
- Do **not** commit your `.tfstate` or AWS credentials to version control.
