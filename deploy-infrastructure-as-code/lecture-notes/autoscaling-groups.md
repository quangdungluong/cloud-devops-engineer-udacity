## AWS::AutoScaling::AutoScalingGroup syntax
```yaml
Resources:
  WebAppGroup:
    Type: AWS::AutoScaling::AutoScalingGroup
    Properties:
      VPCZoneIdentifier:
      - Fn::ImportValue: 
          !Sub "${EnvironmentName}-private-subnets"
      LaunchTemplate:
        LaunchTemplateId: !Ref WebAppLaunchTemplate
        Version: !GetAtt WebAppLaunchTemplate.LatestVersionNumber
      MinSize: '2'
      DesiredCapacity: '2'
      MaxSize: '3'
      TargetGroupARNs:
      - Ref: WebAppTargetGroup
```