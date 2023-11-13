# Client-site VPN

A client-site VPN establishes a secure and encrypted connection between a user and a private network, typically the organization's internal network. The use of a client-site Virtual Private Network (VPN) can be justified for several reasons: Enhanced Security, Remote Access, Protection on Public Networks, Data Privacy and Compliance, Securing Sensitive Transactions, Access Control, Reduced Cybersecurity Risks, etc.

# O Pritunl VPN 

The Pritunl VPN is an open-source solution that provides an intuitive and secure platform for the implementation of Virtual Private Networks (VPNs), emphasizing ease of use and administration. [Pritunl VPN](https://pritunl.com/)

# Terraform

Terraform is an Infrastructure as Code (IaC) tool that allows for the automated and declarative provisioning and management of infrastructure resources. [Terraform](https://www.terraform.io/)

# Google Cloud Platform

The Google Cloud Platform (GCP) is a cloud computing services platform from Google, which includes storage, data processing, machine learning, analytics, and various other resources to facilitate the development, deployment, and scalability of applications. [Google Cloud Platform](https://cloud.google.com/gcp)

## Requirements

* Terraform installed in your machine. Take a look here (https://developer.hashicorp.com/terraform/install)
* A Google Cloud Platform project. All you need is a @gmail account and a credit card (Is totally charge safe, different other cloud cloud providers, you won’t be charged until you upgrade). [Try Google Cloud Platform for free](https://cloud.google.com/free)
* A GCP service account key with the necessary permissions to create GCP resources. You can create a service account key from the GCP Console. https://cloud.google.com/iam/docs/service-accounts-create

# Pritunl VPN on GCP by Terraform

The following Terraform code deploys a Pritunl VPN server on the Google Cloud Platform (GCP).

### Setup

1. Clone the repository:
  ```
  git clone https://github.com/marcelotpcosta/terraform-pritunl-vpn
  ```

2. Into the directory:
  ```
  cd terraform-pritunl-vpn
  ```

3. Initialize the Terraform:
  ```
  terraform init
  ```

4. Create a `terraform.tfvars` file on root dir and set the variables values:
  ```
  credentials_path = "<path-to-service-account-key>" // Save the file in a secure directory outside the project directory to prevent accidental commits
  project_id       = "<your-gcp-project-id>" // Please read that: (https://cloud.google.com/resource-manager/docs/creating-managing-projects)
  region           = "<gcp-region>"
  zone             = "<gcp-zone>"
  server_port      = "<server-port>" // Suggestion 1194
  ```

5. Apply the Terraform:
  ```
  terraform apply
  ```

## Configuration

The `variables.tf` file contains the list of variables used .tfvars configuration file:

- `credentials`: The path to your GCP service account key file.
- `project_id`: Your GCP project ID.
- `region`: The GCP region where the resources will be created.
- `zone`: The GCP zone where the resources will be created.
- `server_port`: Server port through which VPN clients will be connected.

You must set the values of these variables in the `terraform.tfvars` file.

## 

When resources are created sucessfully, the output will show the URL to access the Pritunl web interface, plus with the username and password. So access the web interface and configure the VPN server based on [Pritunl VPN](https://pritunl.com/) documentation.
