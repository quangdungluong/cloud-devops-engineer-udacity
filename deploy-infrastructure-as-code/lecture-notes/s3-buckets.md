## AWS::S3::Bucket syntax
```yaml
Resources:
  MyBucket:
    Type: 'AWS::S3::Bucket'
    Properties:
      BucketName: String
      AccessControl: String
      VersioningConfiguration:
        Status: String
      BucketEncryption:
        ServerSideEncryptionConfiguration:
          - ServerSideEncryptionByDefault:
              SSEAlgorithm: String
      LifecycleConfiguration:
        Rules:
          - ExpirationInDays: Integer
            Status: String
            NoncurrentVersionExpirationInDays: Integer
      PublicAccessBlockConfiguration:
        BlockPublicAcls: Boolean
        IgnorePublicAcls: Boolean
        BlockPublicPolicy: Boolean
        RestrictPublicBuckets: Boolean
```