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


  # Build the AKS Cluster

### 1. Navigate to the `clusterbuild` folder.

Login to Azure CLI using your Azure credentials:
```bash
cd clusterbuild
az login
```
Make sure you're logged in with an admin user who has sufficient permissions to manage the resources in the selected subscription.

Run Terraform commands to create the AKS cluster:

```bash
terraform init
terraform plan
terraform apply
```

This will create the AKS cluster in the specified resource group and virtual network.

Why Store Terraform State in Azure Storage Account?
The Terraform state file is stored in an Azure Storage Account for the following reasons:

Centralized Management: The state file is stored in a shared location, making it easier for multiple users to collaborate on managing the AKS cluster.
Consistency: Storing the state file in Azure ensures that all users are working with the same up-to-date state, avoiding inconsistencies that could arise if the state file were local or stored elsewhere.
Scalability: The storage account approach allows for seamless management of the AKS cluster, even as it grows.
Enabling Prometheus in the Azure Portal
Note: The Terraform code does not include the configuration for enabling Azure Managed Prometheus. This is because Prometheus requires creating a workload identity, which needs to be enabled manually. For this reason, I used the Azure portal to enable Prometheus for the AKS cluster.

To enable Azure Managed Prometheus in the Azure portal:

Go to the Azure Portal and navigate to your AKS Cluster.
In the left-hand menu, select Monitoring and then Insights.
Under Azure Monitor for containers, look for the Prometheus section.
Click Enable Managed Prometheus and follow the prompts to enable it for your AKS cluster.
Once Prometheus is enabled, it will automatically start collecting and storing metrics from your AKS cluster in the configured Log Analytics Workspace.

Additional Notes
Login to Azure: Before running the Terraform scripts, make sure you are logged in to Azure CLI with an account that has valid tenant and subscription details, and admin access to create and manage resources.
Prometheus Enablement: As mentioned, Prometheus is not included in the Terraform configuration. You can enable it through the Azure Portal manually, as outlined in the steps above.
Terraform State: Using Azure Storage Accounts for centralized Terraform state management ensures that the state is easily accessible and manageable for multiple users.
Troubleshooting
Permission Issues: Ensure that you are logged in with an account that has Contributor and Owner permissions on the Azure subscription and resource group.
State File Issues: If you encounter issues related to the Terraform state file, make sure that the Azure Storage Account is correctly configured and accessible. Run terraform init again to ensure that the backend is properly initialized.
