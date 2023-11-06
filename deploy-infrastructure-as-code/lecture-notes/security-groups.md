## Security Group Syntax
```yaml
Type: AWS::EC2::SecurityGroup
Properties: 
  GroupDescription: String
  GroupName: String
  SecurityGroupEgress: 
    - Egress
  SecurityGroupIngress: 
    - Ingress
  Tags: 
    - Tag
  VpcId: String
```

## Intrinsic function: Import value
```yaml
VpcId:
  Fn::ImportValue:
    !Sub "${EnvironmentName}-vpc-id"
```