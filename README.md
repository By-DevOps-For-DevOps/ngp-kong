# ngp-kong

![image](/doc/architecture-diagram.png)

#### Pre-requisites
- AWS IAM account with administrator privileges.
- VPC, Subnets and ECS Cluster (You can use [ngp-infrastructure-codepipeline](https://github.com/microservices-today/ngp-infrastructure-pipeline))
- AWS CLI

#### User Inputs

| Parameter | Description |
|-----------|-------------|
| EnvironmentName | An environment name that will be prefixed to resource names |
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
	- Tag and push the image to ECR.
		- Create a repository in ECR.
		- `aws ecr get-login --region aws-region`
		- `docker tag name/repository aws_acc_id.dkr.ecr.aws_region.amazonaws.com/repo-name:version`
		- `docker push aws_acc_id.dkr.ecr.aws_region.amazonaws.com/repo-name:version`
- Go to AWS CloudFormation UI and select "Create Stack".
- Choose the 'cloudformation.yaml' file from the cloned repo in "Choose file" under "Choose a template" in "Select Template" section.
- Provide the requested parameters in the AWS CloudFormation console.
- Important - Click the checkbox "I acknowledge that AWS CloudFormation might create IAM resources with custom names." under Capabilities section.
- Review the information for the stack. When you're satisfied with the settings, click 'Create'.
- Attach the Kong Admin Target Group with the Auto-scaling group for the ECS Cluster from AWS CLI
    `aws autoscaling attach-load-balancer-target-groups --auto-scaling-group-name "my-asg" --target-group-arns "my-targetgroup-arn"`
