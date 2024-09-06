# Azure VNet Peering with Terraform

This repository contains Terraform code to set up Virtual Network (VNet) Peering in Azure. VNet Peering allows different Virtual Networks within Azure to communicate with each other as if they were part of the same network. This setup is ideal for environments that need to securely connect development and production networks.

## Overview

The provided Terraform configuration creates the following resources:

1. **Resource Group**: A container for the VNets and other resources.
2. **Virtual Networks**:
   - `dev-vnet-a`: A Virtual Network for the development environment.
   - `dev-vnet-b`: A Virtual Network for the production environment.
3. **Subnets**:
   - `dev-subnet-a`: A subnet within `dev-vnet-a`.
   - `dev-subnet-b`: A subnet within `dev-vnet-b`.
4. **VNet Peering**:
   - `dev-vnet-a-to-vnet-b`: Peers `dev-vnet-a` with `dev-vnet-b`.
   - `dev-vnet-b-to-vnet-a`: Peers `dev-vnet-b` with `dev-vnet-a`.

## Prerequisites

Before you begin, ensure you have the following:

- An [Azure account](https://azure.microsoft.com/en-us/free/) with the necessary permissions to create resources.
- [Terraform](https://www.terraform.io/downloads) installed on your local machine.

## Getting Started

### Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/azure-vnet-peering.git
cd azure-vnet-peering
```

### Configure Terraform

1. **Initialize Terraform**: Run the following command to initialize the working directory:

    ```bash
    terraform init
    ```

2. **Review the Plan**: Check what Terraform will do before applying the changes:

    ```bash
    terraform plan
    ```

3. **Apply the Configuration**: Create the resources in Azure by running:

    ```bash
    terraform apply
    ```

   You will be prompted to confirm. Type `yes` to proceed.

4. **Clean Up**: To remove the resources created by Terraform, run:

```bash
terraform destroy
```

## Additional Information

For more details and advanced configurations, please check out the [Terraform Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) and the [Azure VNet Peering Documentation](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview).

Feel free to open an issue or pull request if you have any questions or improvements.

---

**Happy Peering!** 🚀
