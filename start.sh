#!/usr/bin/env bash
echo "==================== Init Terraform ===================="
terraform init -upgrade

echo ""
echo ""
echo "==================== Plan Terraform ===================="
terraform plan -out "planfile"

echo ""
echo ""
echo "==================== Apply Terraform ===================="
terraform apply "planfile"