#!/bin/bash
# 1. Authenticate Docker locally inside the VM
gcloud auth configure-docker us-central1-docker.pkg.dev --quiet

# 2. Pull the newly pushed image
docker pull us-central1-docker.pkg.dev/project-ee16ab9f-709f-4851-b92/cloud-handson-v2/my-app:latest

# 3. Clean up any stale existing container instances
docker stop my-running-app || true
docker rm my-running-app || true

# 4. Start up the brand new container matching your Flask port (80 on VM maps to 8080 in container)
docker run -d --name my-running-app -p 80:8080 us-central1-docker.pkg.dev/project-ee16ab9f-709f-4851-b92/cloud-handson-v2/my-app:latest
