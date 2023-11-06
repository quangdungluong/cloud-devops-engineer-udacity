#!/bin/bash

STACK_NAME="lqdisme-project2-udagram"
ACTION=$1

case $ACTION in

  create)
    aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://udagram.yml \
    --parameters file://udagram-parameters.json \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    --region=us-east-1
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-body file://udagram.yml \
    --parameters file://udagram-parameters.json \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM"
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $STACK_NAME
    ;;

  *)
    echo -n "unknown argument, expecting (create | update | delete)"
    ;;
esac