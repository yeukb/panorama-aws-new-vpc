# Panorama in a new AWS VPC

This will deploy a Panorama instance in a new AWS VPC with the option to add a data disk.


## Prequisites
1. Terraform v1.0 and above

2. AWS AccessKey and SecretKey

3. Panorama AMI for the AWS region you are deploying Panorama
    - run the following aws cli command to get the AMI
        - aws ec2 describe-images --filters "Name=name,Values=Panorama-AWS-10.1*" --region <aws_region> --output json
    - to install aws cli:
        - https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
        - https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html#cli-configure-quickstart-config

4.  VM Instance Type for Panorama
    - https://docs.paloaltonetworks.com/panorama/10-1/panorama-admin/set-up-panorama/set-up-the-panorama-virtual-appliance/setup-prerequisites-for-the-panorama-virtual-appliance.html
    - https://aws.amazon.com/ec2/instance-types/


## Deployment
1. Update the "terraform.tfvars" file with the necessary information.

2. Run "terraform init"

3. Run "terraform apply"

4. Panorama will be deployed. It takes about 15-20 minutes for it to be fully ready.

5. The IP of the Panorama will be shown in the terraform outputs.


## Removing The VM
1. Run "terraform destroy"


