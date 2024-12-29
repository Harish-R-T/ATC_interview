# Terraform AKS Cluster Setup with Azure Storage for State Management

This repository contains Terraform configurations for setting up an Azure Kubernetes Service (AKS) cluster and using Azure Storage Account for centralized state management. The state file is stored in Azure Storage to ensure that multiple users can manage and maintain the AKS cluster consistently.

## Steps to Set Up

### 1. Create the Azure Storage Account for Terraform State

To store the Terraform state file centrally, you need to create an Azure Storage Account. This allows multiple users to work with the same state file without conflicts, making state management easier and more reliable.

- Navigate to the `storageaccount` folder in the repository.
- Run the following commands to create the Azure Storage Account where the Terraform state will be stored:

  ```bash
  cd storageaccount
  terraform init
  terraform plan
  terraform apply
