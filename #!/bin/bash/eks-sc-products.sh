#!/bin/bash

aws s3 cp scproducts/ s3://eksportfolioproducts/ --recursive --exclude "*" --include "*.yml" --include "*.zip"

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSNetwork --parameters file://$HOME/devsecops-book/chapter-2/parameter/NetworkProduct.json --region us-east-1

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSIAM --parameters file://$HOME/devsecops-book/chapter-2/parameter/IAMProduct.json --region us-east-1

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSCluster --parameters file://$HOME/devsecops-book/chapter-2/parameter/EKSProduct.json --region us-east-1

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSNodeGroup --parameters file://$HOME/devsecops-book/chapter-2/parameter/EKSNodeGroupProduct.json --region us-east-1

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSLambda --parameters file://$HOME/devsecops-book/chapter-2/parameter/EKSLambdaProduct.json --region us-east-1

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSVPCEndpoint --parameters file://$HOME/devsecops-book/chapter-2/parameter/VPCEndpointProduct.json --region us-east-1

aws cloudformation create-stack --template-body file://$HOME/devsecops-book/chapter-2/template/ServiceCatalogProduct.yml \
--stack-name EKSLog --parameters file://$HOME/devsecops-book/chapter-2/parameter/EKSLoggingProduct.json --region us-east-1