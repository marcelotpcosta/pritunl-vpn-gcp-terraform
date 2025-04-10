# Introduction

This repo includes terraform code to deploy a Pritunl VPN server instance on Google Cloud Platform (GCP). Also, we will leverage the Identity-Aware Proxy to provide secure SSH access to the VM instance, needed to a final step to configure your Pritunl VPN server.

# Definitions

## Client-site VPN

A client-site VPN establishes a secure and encrypted connection between a user and a private network, typically the organization's internal network. The use of a client-site Virtual Private Network (VPN) can be justified for several reasons: Enhanced Security, Remote Access, Protection on Public Networks, Data Privacy and Compliance, Securing Sensitive Transactions, Access Control, Reduced Cybersecurity Risks, etc.

## Pritunl VPN 

The Pritunl VPN is an open-source solution that provides an intuitive and secure platform for the implementation of Virtual Private Networks (VPNs), emphasizing ease of use and administration. [Pritunl VPN](https://pritunl.com/)

## Terraform

Terraform is an Infrastructure as Code (IaC) tool that allows for the automated and declarative provisioning and management of infrastructure resources. [Terraform](https://www.terraform.io/)

## Google Cloud Platform

The Google Cloud Platform (GCP) is a cloud computing services platform from Google, which includes storage, data processing, machine learning, analytics, and various other resources to facilitate the development, deployment, and scalability of applications. [Google Cloud Platform](https://cloud.google.com/gcp)

### Identity-Aware Proxy

With TCP forwarding, IAP can protect SSH and RDP access to your VMs hosted on Google Cloud. Not this case but, your VM instances don't even need public IP addresses.

# Requirements

* A Google Cloud Platform (GCP) project. For that all you need is a @gmail account and a credit card (Is totally charge safe, you won’t be charged until you upgrade). You can use this link to claim $300 in free credits, [Try Google Cloud Platform for free](https://cloud.google.com/free). Also I recommend read [Creating and managing projects](https://cloud.google.com/resource-manager/docs/creating-managing-projects).

* Terraform. [Install Terraform](https://developer.hashicorp.com/terraform/install)

* gcloud CLI [Install the gcloud CLI](https://cloud.google.com/sdk/docs/install)

# Deploy a Pritunl VPN instance on GCP by Terraform

The following Terraform code deploys a Pritunl VPN server on the Google Cloud Platform (GCP).

## Setup

1. Clone the repository:
  ```
  git clone https://github.com/marcelotpcosta/pritunl-vpn-gcp-terraform
  ```

2. Into the directory:
  ```
  cd pritunl-vpn-gcp-terraform
  ```

3. Make a copy of the `terraform.tfvars.example` to `terraform.tfvars`
  ```
  cp terraform.tfvars.example terraform.tfvars
  ```

4. Fill the values and save it. Note that the `variables.tf` file contains the declaration of variables used by tfvars configuration file.

- `project_id`: Your GCP project ID. See [Creating and managing projects](https://cloud.google.com/resource-manager/docs/creating-managing-projects)
- `region`: The GCP region where the resources will be created. See [GCP regions and zones](https://cloud.google.com/compute/docs/regions-zones)
- `zone`: The GCP zone where the resources will be created. See [GCP regions and zones](https://cloud.google.com/compute/docs/regions-zones)
- `server_port`: Server port which VPN clients will connect, for example the standard OpenVPN port "1194"
- `instance_type`: The intance size. See [GCP machine types](https://cloud.google.com/compute/docs/machine-resource)
- `server_name`: The server name on GCP console and OS hostname, for example "my-vpn-server"

5. Then perform the following commands on the root folder:

- `terraform init` to get the plugins
- `terraform plan` to see the infrastructure plan
- `terraform apply` to apply the infrastructure build

6. When necessary
- `terraform destroy` to destroy the built infrastructure

7. ***Pritunl setup:*** After resources creation, the output will show the public IP to access the Pritunl web interface, so access the Pritunl web interface and follow this instructions to the basic and secure configuration. The page may take take a while to load.

***- Important:*** In order to perform the upcoming procedures, it is essential to connect to the server via SSH. As we utilize IAP (Identity-Aware Proxy), accessing SSH is conveniently achieved through the GCP console. Simply navigate to the console, choose the project, go to the compute engine section, select your virtual machine (VM), and then click on the SSH access button. Please note that being a ***project owner*** is a prerequisite for this process.

8. [Pritunl VPN database setup](https://docs.pritunl.com/docs/configuration-5#database-setup)
9. [Initial Setup](https://docs.pritunl.com/docs/configuration-5#initial-setup)
10. [Creating Organization and User](https://docs.pritunl.com/docs/connecting#creating-organization-and-user)
11. [Creating Server](https://docs.pritunl.com/docs/connecting#creating-server)
12. [Downloading User Profile](https://docs.pritunl.com/docs/connecting#downloading-user-profile)