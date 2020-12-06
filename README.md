# aws_website_hosting

## Deployment
### Deploying the Infrastructure
The infrastructure is deployed using terraform (tested on v0.13.3). Before the infrastructure can be deployed, you will need to create an S3
bucket for holding the remote state, and a DynamoDB table for the state locks. The names of the bucket and DynamoDB table 
then need to be placed in `terraform/environments/dev/backend.tfvars`, replacing the example values already there.
Next, run the following command to initialise your terraform:
```commandline
teraform init --backend-config=environments/dev/backend.tfvars
```
You can now deploy the infrastructure using the following command:
```commandline
terraform apply -var-file=environments/dev/variables.tfvars
```
You will be promted for a `website_version`. Enter whatever value you wish for the website version - it will be needed
when deploying the website.

### Deploying the Website
The deployment of the website can be run using the script `deployment/deploy.sh`. This script uploads the files under 
`src/` to the S3 bucket created via terraform, after replacing any occurrences of `{version}` in the html files with the
website version that you pass to the script.

Example:
```commandline
./deployment/deploy.sh "dev-my-example-website-20201206185458185800000002" v1
```

### Website Versioning
The website is versioned so that the website can be updated without having to invalidate the cache in cloudfront.
The terraform for cloudfront specifies a default root object which has the website version in its path, which is how new
website versions are deployed.

### Deployment Order
For the initial deploy the terraform must be deployed before the website. However, after the initial deploy the website 
deployment script must be run first - otherwise the website will be down since there will be no files to serve.

## Future changes
For a production website a custom domain should be used. This will require the purchasing of a domain and then setting 
up a hosted zone and DNS records in AWS route53 targeting the cloudfront distribution's domain name. To enable the use of https
with the custom domain AWS certificate manager can be used for storing and validating the certificate.

The cloudwatch distribution is using the cheapest price class, which means that not all edge locations are used. To 
improve the latency in regions not served by the enabled edge locations a higher price class should be used.

For security a web application firewall can be created via AWS WAF. This allows rules to be created for filtering traffic 
to the website. A good place to start for rules to apply is the top ten web application security risks identified by OWASP,
which can be found [here](https://owasp.org/www-project-top-ten/). This will become far more important when hosting a 
non-trivial website, unlike this current one. 
