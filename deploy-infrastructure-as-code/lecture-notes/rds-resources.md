## AWS::RDS::DBInstance syntax
```yaml
Resources:
  MyDBInstance:
    Type: 'AWS::RDS::DBInstance'
    Properties:
      AllocatedStorage: Integer
      AutoMinorVersionUpgrade: Boolean
      BackupRetentionPeriod: Integer
      DBInstanceClass: String
      DBInstanceIdentifier: String
      DBName: String
      VPCSecurityGroups:
        - String
      DBParameterGroupName: String
      DBSubnetGroupName: String
      Engine: String
      EngineVersion: String
      MasterUsername: String
      MasterUserPassword: String
      MultiAZ: Boolean
```

## AWS::RDS::DBSubnetGroup syntax
```yaml
Resources:
  SubnetGroup:
    Type: 'AWS::RDS::DBSubnetGroup'
    Properties:
      DBSubnetGroupName: String
      DBSubnetGroupDescription: String
      SubnetIds:
        - !Ref SomeExistingSubnet1
        - !Ref SomeExistingSubnet2
```

## AWS::RDS::DBParameterGroup syntax
```yaml
Resources:
  SubnetGroup:
    Type: 'AWS::RDS::DBSubnetGroup'
    Properties:
      DBSubnetGroupName: String
      DBSubnetGroupDescription: String
      SubnetIds:
        - !Ref SomeExistingSubnet1
        - !Ref SomeExistingSubnet2
```