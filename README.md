# Create a HashiCorp-managed Vault cluster on the HashiCorp Cloud Platform (HCP) #
## Architecture ##

![Cohort-GitHub - TFC - HCP - Vault](https://github.com/yeemon4398/hcp-managed-vault-cluster/assets/40330106/01cded53-3538-4a46-a7a2-d5d8096eb912)

## Summary ##
- Included platforms and services
- Pre-requisites
- Connection between local PC and GitHub
- Connection between GitHub and Terraform Cloud
- Connection between Terraform Cloud (TFC) and Hashicorp Cloud Platform (HCP)
- Start run at TFC
- Access the Vault cluster
- Clean up the Vault cluster
<br>

## Details ##
### Included platforms and services ###
- GitHub
- Terraform Cloud
- HashiCorp Cloud Platform
- HashiCorp-managed Vault service
<br>

### Pre-requisites ###
- GitHub account [can use other Version Control Systems such as GitLab, Bitbucket, Azure DevOps, ...]
- Terraform Cloud account [https://app.terraform.io/public/signup/account]
- HashiCorp Cloud Platform account [https://www.hashicorp.com/cloud]
<br>

### Connection between local PC and GitHub ###
#### 1. Prepare Terraform configuration files ####
- Official documentation link of HCP provider for Terraform configuration [https://registry.terraform.io/providers/hashicorp/hcp/latest/docs]
- Can reference my sample Terraform configuration files and replace your preferred values at variables.tf file as per official documentation [https://github.com/yeemon4398/hcp-managed-vault-cluster]

#### 2. Generate a personal classic token at GitHub ####
- Generate a personal classic token to authenticate GitHub from the local PC
- Account > Settings > Developer Settings > Personal access tokens > Tokens (classic) > Generate new token > Generate new token (classic)

#### 3. Push Terraform configuration files to a new repository at GitHub ####
- Create a new repository at GitHub
- Push previously created Terraform configuration files to the previously created repository
<br>

### Connection between GitHub and Terraform Cloud ###
#### 4. Create an organization and workspace with Version Control Workflow ####
- Create an organization under the Terraform Cloud account
- Create a workspace with Version Control Workflow under the previously created organization
- Connect to VCS > GitHub
- Choose a repository > Choose previously created Terraform configuration files repository
- Some information to register an OAuth application at GitHub will be found

#### 5. Register a new OAuth App at GitHub ####
- Account > Settings > Developer Settings > Register a new OAuth application

#### 6. Fill up information from the Terraform Cloud (TFC) ####
- Application name < Application name from TFC
- Homepage URL < Homepage URL from TFC
- Authorization callback URL < Authorization callback URL from TFC
- Client ID and Client secrets to fill up in the TFC's workspace will be found

#### 7. Fill up information from the GitHub OAuth App ####
- Client ID < Client ID from GitHub
- Client Secret < Client secrets from GitHub
- Authorize Terraform Cloud and GitHub connection
<br>

### Connection between Terraform Cloud (TFC) and Hashicorp Cloud Platform (HCP) ###
#### 8. Create an organization and project under the HCP account ####
- Create an organization under the HCP account
- Create a project under the previously created organization

#### 9. Create a service principal key under the project (or organization) ####
- Project > Access control (IAM) > Service principals > Create a service principal with Contributor role
- Create a service principal key under the previously created service principal
- Client ID and Client secret to authenticate the HCP from the TFC will be found

#### 10. Set environment variables at TFC to authenticate HCP ####
- At TFC, previously created workspace > Variables > Create 2 environment variables
- HCP_CLIENT_ID < Client ID from HCP
- HCP_CLIENT_SECRET < Client Secret from HCP
<br>

### Start run at TFC ###
#### 11. Start run at TFC to create a HashiCorp-managed Vault cluster as per Terraform configuration files ####
- New run > Start run
- Need to run one time
- TFC's VCS workflow will monitor GitHub and automatically run when there are any changes to the Terraform configuration files
<br>

### Access the Vault cluster ###
#### Check the Vault cluster at HCP console ####
- HCP > Organization > Project > Vault

#### Access the Vault cluster from the UI ####
- Cluster URLs > **Public** > Open the copied public link in another browser tab
- New admin token > **Generate token** to provide Vault cluster UI

#### Access the Vault cluster from the CLI ####
- How to access via > **Command-line (CLI)**
- CLI < need to export VAULT_ADDR and VAULT_TOKEN as per Connect to your Vault cluster information box

##### Some Vault CLI commands #####
- vault status
- vault auth list
- vault policy list
- vault secrets list
<br>

### Clean up the Vault cluster ###
#### Clean up the Vault cluster from the TFC ####
- TFC > Organization > Workspace > Settings > Destruction and Deletion > Queue destroy plan
