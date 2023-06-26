# Define variables
$IMAGE_NAME = "hello_world_app"
$DEPLOYMENT_NAME = "hello_world_deployment"
$SERVICE_NAME = "hello_world_service"
$KIND_CONTEXT = "kind-test-cluster"

# Check if the local Docker registry is already running
if (-not (docker ps -q -f name=local-registry)) {
    if (-not (docker ps -aq -f status=exited -f name=local-registry)) {
        # Run the local Docker registry if it doesn't already exist
        docker run -d -p 5000:5000 --name=local-registry registry:2
    } else {
        # Restart the local Docker registry container if it is stopped
        docker start local-registry
    }
}

# Go to the main directory
Set-Location # Fill in the path where the Dockerfile is located

# Build the Docker image
docker build -t localhost:5000/$IMAGE_NAME:latest ./app

# Check the Docker image
docker run --name test-container -d -p 3000:3000 localhost:5000/$IMAGE_NAME:latest
Start-Sleep -s 5 # Wait a few seconds for the application to start

# Test the application
$response = Invoke-WebRequest -UseBasicParsing -Uri http://localhost:3000
if ($response.Content -match "Hello, World!") {
    Write-Output "Test successful!"
} else {
    Write-Output "Test failed!" >&2
    exit 1
}

# Stop and remove the test container
docker stop test-container
docker rm test-container

# Push the Docker image
docker push localhost:5000/$IMAGE_NAME:latest

# Check if the kind context exists
$contexts = kubectl config get-contexts -o=name
if ($contexts -notcontains $KIND_CONTEXT) {
    Write-Output "$KIND_CONTEXT does not exist. Please set up kind."
    exit 1
}

# Set the kubectl context to kind context
kubectl config use-context $KIND_CONTEXT

# Use kubectl to deploy the application
kubectl run $DEPLOYMENT_NAME --image=localhost:5000/$IMAGE_NAME:latest --port=3000
kubectl expose deployment $DEPLOYMENT_NAME --type=LoadBalancer --name=$SERVICE_NAME --port=3000
