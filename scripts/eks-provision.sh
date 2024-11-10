#!/bin/bash

PROFILE=default
REGION=us-east-1
PRODUCTID="prod-govqzewtpe5cy"  # Use ProductId directly
PROVISIONARTIFACTID=$(aws servicecatalog describe-product --id $PRODUCTID --region $REGION --query 'ProvisioningArtifacts[0].Id' --output text)

# Check if PROVISIONARTIFACTID was retrieved successfully
if [ -z "$PROVISIONARTIFACTID" ]; then
  echo "Error: Provisioning Artifact ID not found. Check the ProductId and IAM permissions."
  exit 1
fi

# Provision the Product
aws servicecatalog provision-product \
    --provisioned-product-name "eks-provision" \
    --provisioning-artifact-id $PROVISIONARTIFACTID \
    --product-id $PRODUCTID \
    --provisioning-parameters file://parameter/eks-provisioner.json \
    --profile $PROFILE \
    --region $REGION
