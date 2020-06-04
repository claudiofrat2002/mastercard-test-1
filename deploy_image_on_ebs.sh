#!/bin/bash
#Login to the ecr container
aws ecr get-login-password --region eu-west-1 | docker login --username AWS --password-stdin 435256028167.dkr.ecr.eu-west-1.amazonaws.com

#Build the local images
docker build -t hello-world-test .

#Tag in the aws_ecr_repository
docker tag hello-world-test:latest 435256028167.dkr.ecr.eu-west-1.amazonaws.com/hello-world-test:latest

#docker push
docker push 435256028167.dkr.ecr.eu-west-1.amazonaws.com/hello-world-test:latest

#Run the update of the aws_elastic_beanstalk_environment
 aws elasticbeanstalk update-environment --application-name hello-world-app --environment-name hello-world-app-dev --version-label tf-test-version-label
