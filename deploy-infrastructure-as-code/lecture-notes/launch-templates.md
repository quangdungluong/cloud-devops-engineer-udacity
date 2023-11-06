## AWS::EC2::LaunchTemplate syntax
```yaml
Type: AWS::EC2::LaunchTemplate
Properties: 
  LaunchTemplateData: 
    LaunchTemplateData
  LaunchTemplateName: String
```

## Adding a Launch Template
```yaml
Resources:
  WebAppLaunchTemplate:
    Type: AWS::EC2::LaunchTemplate
    Properties:
      LaunchTemplateName: !Sub "web-servers-template"
      LaunchTemplateData:
        UserData:
          echo "Hello, I'm a server ready to work!"
        ImageId: ami-0557a15b87f6559cf
        SecurityGroupIds:
          - !Ref WebServerSecGroup
        InstanceType: t2.micro
        IamInstanceProfile:
          Name: !Ref WebServerInstanceProfile
        BlockDeviceMappings:
        - DeviceName: "/dev/sdk"
          Ebs:
            VolumeSize: '50'
```

## Assuming IAM roles from Launch Template instances
```yaml
Resources:
  WebServerInstanceRole:
    Type: AWS::IAM::Role
    Properties:
      RoleName: web-servers-instance-role"
      AssumeRolePolicyDocument:
        Version: '2012-10-17'
        Statement:
        - Effect: 'Allow'
          Principal:
            Service:
            - 'ec2.amazonaws.com'
          Action:
          - 'sts:AssumeRole'
      Policies:
        - PolicyName: s3
          PolicyDocument:
            Version: '2012-10-17'
            Statement:
            - Effect: Allow
              Action:
              - 's3:PutObject*'
              - 's3:GetObject*'
              - 's3:DeleteObject*'
              Resource:
                - !Ref SomeBucketArn
  WebServerInstanceProfile:
    Type: AWS::IAM::InstanceProfile
    Properties:
      Path: '/'
      Roles:
      - !Ref WebServerInstanceRole
```