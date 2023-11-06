## Route Tables
```yaml
Type: AWS::EC2::RouteTable
Properties: 
  VpcId: String
  Tags:
    - Tag
```

## Adding Route Tables to your network
```yaml
Resources:
  PublicRouteTable:
    Type: AWS::EC2::RouteTable
    Properties: 
      VpcId: !Ref VPC
      Tags: 
        - Key: Name 
          Value: !Sub ${EnvironmentName} Public Routes
```

## Route
```yaml
Type: AWS::EC2::Route
Properties: 
  DestinationCidrBlock: String
  GatewayId: String
  NatGatewayId: String
  RouteTableId: String
```

## The default public route
```yaml
Resources:
  DefaultPublicRoute: 
    Type: AWS::EC2::Route
    DependsOn: InternetGatewayAttachment
    Properties: 
      RouteTableId: !Ref PublicRouteTable
      DestinationCidrBlock: 0.0.0.0/0
      GatewayId: !Ref InternetGateway
```

## The default private route
```yaml
Resources:
  DefaultPrivateRoute1:
    Type: AWS::EC2::Route
    Properties:
      RouteTableId: !Ref PrivateRouteTable1
      DestinationCidrBlock: 0.0.0.0/0
      NatGatewayId: !Ref NatGateway1
```

## SubnetRouteTableAssociation
```yaml
Type: AWS::EC2::SubnetRouteTableAssociation
Properties: 
  RouteTableId: String
  SubnetId: String
```

## Associate Route Table to a Subnet
```yaml
Type: AWS::EC2::SubnetRouteTableAssociation
Properties: 
  RouteTableId: String
  SubnetId: String
```