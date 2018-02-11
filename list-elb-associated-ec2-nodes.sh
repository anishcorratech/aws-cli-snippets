#!/bin/bash

echo -e "\nListing Associated EC2 instances in an ELB..."
aws --profile=$1 --region=$2 elb describe-load-balancers --load-balancer-name $3 | jq -r '.LoadBalancerDescriptions[] | {Associated_Instances: .Instances[]}'
