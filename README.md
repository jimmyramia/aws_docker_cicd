# Project: CI / CD Pipeline For Docker Deployments

This project contains the infrastructure as code (IaC) for a CI/CD pipeline for Docker Deployments.  The repository includes CloudFormation code that sets up an AWS CodePipeline to manage all of the steps from build, testing, and deployment.  The steps include use of CodeBuild to:
** Run the gradle tests
** Build a docker image from a DockerFile and push the image to ECR.  
** Use of docker compose file to deploy the service in Fargate.  

In addition to that, the code includes IaC for the provisioning the deployment environment which is a Fargate Cluster

** Build trigger

Step 1: When code is pushed into this repository, it triggers a build in codebuild.

** Cleanup
