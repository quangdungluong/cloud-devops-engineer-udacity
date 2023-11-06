# Running tests
```bash
# Use correct Nodejs version
nvm use
# Install dependencies
npm ci
# Run the tests interactively. You'll need to press `a` to run the tests
npm test
# simulate running the tests in a CI environment
CI=true npm test
```

# Running linter
```bash
npm run lint
```

# Build and run
```bash
# Run local development server with hot reloading and point to the backend default
REACT_APP_MOVIE_API_URL=http://localhost:5000 npm start

# Build the frontend application for a production deployment
docker build --build-arg=REACT_APP_MOVIE_API_URL=http://localhost:5000 --tag=mp-frontend:latest .

docker run --name mp-frontend -p 3000:3000 -d mp-frontend
```

# Deploy Kubernetes Manifests
```bash
cd starter/frontend/k8s

kustomize edit set image frontend=<ECR_REPO_URL>:<NEW_TAG_HERE>

kustomize build | kubectl apply -f -
```