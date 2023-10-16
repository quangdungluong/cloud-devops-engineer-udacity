## create-stack Command
```
aws cloudformation create-stack \
    --stack-name udacity-workflow-lesson \
    --template-body file://workflow-and-helpers.yml \
    --parameters file://workflow-and-helpers-parameters.json \
    --region us-east-1
```

## update-stack Command
```
aws cloudformation update-stack \
    --stack-name udacity-workflow-lesson \
    --template-body file://workflow-and-helpers.yml \
    --parameters file://workflow-and-helpers-parameters.json \
    --region us-east-1
```

## delete-stack Command
```
aws cloudformation delete-stack \
    --stack-name udacity-workflow-lesson \
    --region us-east-1
```

## deploy Command
```
aws cloudformation deploy \
    --stack-name udacity-workflow-lesson \
    --template-file workflow-and-helpers.yml \
    --parameter-overrides file://worflow-and-helpers-parameters.json \
    --region us-east-1
```