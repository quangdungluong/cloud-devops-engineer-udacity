#!/bin/bash
set -e -o pipefail

echo "Fetching IAM github-action-user ARN"
# userarn=$(aws iam get-user --user-name github-action-user | jq -r .User.Arn)
userarn="arn:aws:iam::419467903201:user/github-action-user"

# Download tool for manipulating aws-auth
# echo "Downloading tool..."
# curl -Lo aws-iam-authenticator https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.6.11/aws-iam-authenticator_0.6.11_darwin_amd64
# chmod +x aws-iam-authenticator

export AWS_ACCESS_KEY_ID=ASIAWDKR4IDQWBD53DU4
export AWS_SECRET_ACCESS_KEY=JVp78g/eOZyDrZTZ3RF4y4dZvP4RFvpdp2i4YjkQ
export AWS_SESSION_TOKEN=FwoGZXIvYXdzEGcaDJIYXXVrkxqrd6JIdCLVAcd5UAVtyzUdL3N3efTNz6bqMOm9M8Fsfdup9nVzVhrm6vZgBJUo/JDuJGE2v7rahMJF0zMu66RqBW1QYmJe3wpC54DBQqpWLVbnjKoBALQ/TjL3RwxO1kAFHXxYU/dvFjhZ2amdXT8/ZIW+Uchq6D6RFJwLqGk6yZ69YT6z17WEGtn37Ife29q/q426hZ25fFbIeuNvmFN7UCCYCM9H3wt7u6FsiN+bnZRw9jJvXzkevJ7ryXpv0MO68gjxjDUljnma0slcT/mq0tH/VphzwTvppkjrYij31aOqBjItLrrO/BUh3ifsb6FG3o/bRepAef3wOgS9cC071nYo7+QMh9ZE5pLifGb9sDPn

echo "Updating permissions"
# ./aws-iam-authenticator add user --userarn="${userarn}" --username=github-action-role --groups=system:masters --kubeconfig="$HOME"/.kube/config --prompt=false
./aws-iam-authenticator add user --userarn="${userarn}" --username=github-action-role --groups=system:masters --kubeconfig="$HOME"/.kube/config
# ./aws-iam-authenticator add user --userarn="arn:aws:iam::419467903201:user/github-action-user" --username=github-action-role --groups=system:masters --kubeconfig="$HOME"/.kube/config --prompt=false

echo "Cleaning up"
rm aws-iam-authenticator
echo "Done!"