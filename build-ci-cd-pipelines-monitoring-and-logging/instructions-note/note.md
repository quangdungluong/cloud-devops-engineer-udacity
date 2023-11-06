# Install terraform
```bash
brew install terraform
```

# Setup a CD Environment
```bash
cd setup/terraform
# Install plugins required
terraform init

terraform destroy
```

# Export AWS Credentials
```bash
export AWS_ACCESS_KEY_ID={copied-access-key}
export AWS_SECRET_ACCESS_KEY={copied-secret-key}
export AWS_SESSION_TOKEN={copied-session-token}

export AWS_ACCESS_KEY_ID=ASIAWDKR4IDQWBD53DU4
export AWS_SECRET_ACCESS_KEY=JVp78g/eOZyDrZTZ3RF4y4dZvP4RFvpdp2i4YjkQ
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEGcaDJIYXXVrkxqrd6JIdCLVAcd5UAVtyzUdL3N3efTNz6bqMOm9M8Fsfdup9nVzVhrm6vZgBJUo/JDuJGE2v7rahMJF0zMu66RqBW1QYmJe3wpC54DBQqpWLVbnjKoBALQ/TjL3RwxO1kAFHXxYU/dvFjhZ2amdXT8/ZIW+Uchq6D6RFJwLqGk6yZ69YT6z17WEGtn37Ife29q/q426hZ25fFbIeuNvmFN7UCCYCM9H3wt7u6FsiN+bnZRw9jJvXzkevJ7ryXpv0MO68gjxjDUljnma0slcT/mq0tH/VphzwTvppkjrYij31aOqBjItLrrO/BUh3ifsb6FG3o/bRepAef3wOgS9cC071nYo7+QMh9ZE5pLifGb9sDPn
```

# Create AWS infrastructure with Terraform
```bash
terraform apply
```

# Retrieve the output
```bash
terraform output
```

# Generate AWS access keys for GitHub Actions
```
1. Launch `Cloud Gateway`, go to `IAM Service`
2. Go to `github-action-user` user account
3. Go to `Security Credentials`
4. Select `Create access key` under `Access keys`
5. Select `Application running outside AWS`, click `Next`, then `Create access key`
```

# Add GitHub Action user to Kubernetes
```
- Add the `github-action` IAM user ARN to the Kubernetes configuration to allow that user to execute `kubectl` commands against the cluster.

cd setup
./init.sh

```