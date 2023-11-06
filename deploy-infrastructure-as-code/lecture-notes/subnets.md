## Intrinsic function: GetAZs
```AvailabilityZone: !Select [ 0, !GetAZs '' ]```

## Subnets Syntax
```yaml
Type: AWS::EC2::Subnet
Properties: 
  AssignIpv6AddressOnCreation: Boolean
  AvailabilityZone: String
  CidrBlock: String
  Ipv6CidrBlock: String
  MapPublicIpOnLaunch: Boolean
  Tags: 
    - Tag
  VpcId: String
```

## Adding Subnets to the VPC
```yaml
PrivateSubnet1: 
  Type: AWS::EC2::Subnet
  Properties:
    VpcId: !Ref VPC
    AvailabilityZone: !Select [ 0, !GetAZs '' ]
    CidrBlock: !Ref PrivateSubnet1CIDR
    MapPublicIpOnLaunch: false
    Tags: 
      - Key: Name 
        Value: !Sub ${EnvironmentName} Private Subnet (AZ1)

PrivateSubnet2: 
  Type: AWS::EC2::Subnet
  Properties:
    VpcId: !Ref VPC
    AvailabilityZone: !Select [ 1, !GetAZs '' ]
    CidrBlock: !Ref PrivateSubnet2CIDR
    MapPublicIpOnLaunch: false
    Tags: 
      - Key: Name 
        Value: !Sub ${EnvironmentName} Private Subnet (AZ2)
```