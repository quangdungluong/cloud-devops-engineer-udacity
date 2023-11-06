## NAT Gateway Syntax
```yaml
Type: AWS::EC2::NatGateway
Properties: 
  AllocationId: String
  SubnetId: String
```

## Adding a NAT Gateway to our VPC
```yaml
Resources:
  NatGateway1EIP:
    Type: AWS::EC2::EIP
    DependsOn: InternetGatewayAttachment
    Properties: 
      Domain: vpc

  NatGateway2EIP:
    Type: AWS::EC2::EIP
    DependsOn: InternetGatewayAttachment
    Properties:
      Domain: vpc

  NatGateway1: 
    Type: AWS::EC2::NatGateway
    Properties: 
      AllocationId: !GetAtt NatGateway1EIP.AllocationId
      SubnetId: !Ref PublicSubnet1

  NatGateway2: 
    Type: AWS::EC2::NatGateway
    Properties:
      AllocationId: !GetAtt NatGateway2EIP.AllocationId
      SubnetId: !Ref PublicSubnet2
```

