## Outputs
```yaml
Outputs:
  VpcId:
    Description: A reference to the created VPC
    Value: !Ref VPC
    Export:
      Name: !Sub ${EnvironmentName}-VPCID
```

## Intrinsic Function: Join
```Fn::Join: [ delimiter, [ comma-delimited list of values ] ```


```yaml
Outputs:
  PublicSubnets:
    Description: A list of the public subnets
    Value: !Join [ ",", [ !Ref PublicSubnet1, !Ref PublicSubnet2 ]]
      Export:
        Name: !Sub ${EnvironmentName}-PUB-NETS
```