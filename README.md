# ngp-kong

![image](/doc/architecture-diagram.png)

#### Pre-requisites
- AWS IAM account with administrator privileges.
- VPC, Subnets and ECS Cluster (You can use [ngp-infrastructure-codepipeline](https://github.com/microservices-today/ngp-infrastructure-pipeline))

#### User Inputs

| Parameter | Description |
|-----------|-------------|
| EnvironmentName | An environment name that will be prefixed to resource names |
| KongGatewayCIDR | The CIDR IPv4 address range to which permission will be given to access Kong Gateway |
| KongAdminCIDR | The CIDR IPv4 address range to which permission will be given to access Konga and Kong Admin APIs |
| DatabaseUsername | Kong Database username |
| DatabasePassword | Kong Database password |
| DatabaseClass | Database instance class |
| DatabaseAllocatedStorage | The size of the database (GB) |

#### Steps

- Clone the repo and change directory to the repo.
- Create the docker image for ngp-kong
	- You can edit the Dockerfile if customization is required.
	- Change directory to Docker and build the image
		`docker build -t name/repository .`
- Go to AWS CloudFormation UI and select "Create Stack".
- Choose the 'cloudformation.yaml' file from the cloned repo in "Choose file" under "Choose a template" in "Select Template" section.
- Provide the requested parameters in the AWS CloudFormation console.
- Important - Click the checkbox "I acknowledge that AWS CloudFormation might create IAM resources with custom names." under Capabilities section.
- Review the information for the stack. When you're satisfied with the settings, click 'Create'.
