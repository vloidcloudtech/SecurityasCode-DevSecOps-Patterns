#!/bin/bash

REGION="us-east-1"
PROFILE="default"

# Delete provisioned product
aws servicecatalog terminate-provisioned-product \
    --provisioned-product-name "eks-provision" \
    --region $REGION \
    --profile $PROFILE

# Delete CloudFormation stacks if needed
aws cloudformation delete-stack --stack-name EKSPortfolio --region $REGION
aws cloudformation delete-stack --stack-name EKSNetwork --region $REGION
# Add more stacks as needed

# Delete S3 bucket
aws s3 rb s3://eksportfolioproducts-project --force --region $REGION

echo "Infrastructure teardown complete."
