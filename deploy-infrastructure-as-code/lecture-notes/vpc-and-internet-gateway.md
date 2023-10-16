```yaml
Resources:

  VPC: 
    Type: AWS::EC2::VPC
    Properties:
      CidrBlock: !Ref VpcCIDR
      EnableDnsHostnames: true
      Tags: 
      - Key: Name 
        Value: !Ref EnvironmentName            

  InternetGateway:
    Type: AWS::EC2::InternetGateway
    Properties:
      Tags:
      - Key: Name
        Value: !Ref EnvironmentName

  InternetGatewayAttachment:
    Type: AWS::EC2::VPCGatewayAttachment
    Properties:
      InternetGatewayId: !Ref InternetGateway
      VpcId: !Ref VPC
```

When connecting an `Internet Gateway` to a `VPC`, we need to define an additional resource called `InternetGatewayAttachment`. This attachment references both the VPC and the InternetGateway.