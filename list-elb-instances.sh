#!/bin/bash

for region in `aws --profile=$1 ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing ELB's in region:'$region'..."
     #aws ec2 describe-load-balancers --profile=$1 --region $region | jq '.Reservations[] | ( .Instances[] | {state: .State.Name, name: .KeyName, type: .InstanceType, key: .KeyName})'
     aws elb describe-load-balancers --profile=$1 --region $region | jq -r '.LoadBalancerDescriptions[].CanonicalHostedZoneName'
done
