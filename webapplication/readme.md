# Web Application Deployment

This repository contains instructions for building and deploying a Dockerized web application. Follow the steps below to build the Docker image and push it to Docker Hub.

## Pre-requisites

Before you start, ensure you have the following:

- **Docker**: Install Docker on your machine. You can download it from [here](https://www.docker.com/get-started).
- **Docker Hub Account**: Create an account on [Docker Hub](https://hub.docker.com/).
- **Docker CLI**: Ensure that Docker CLI is properly installed and configured on your local machine.

## Steps to Deploy the Solution

### Step 1: Build the Docker Image

1. **Navigate to the directory** containing the `Dockerfile` and `index.html` file. This should be the root of your project.

2. **Build the Docker image** by running the following command in the terminal:

   ```bash
   docker build -t <your-dockerhub-username>/web-app:latest .
Replace <your-dockerhub-username> with your Docker Hub username.
This command will create the Docker image using the Dockerfile in the current directory.
### Step 2: Push the Docker Image to Docker Hub
After the image has been built, push the image to Docker Hub using the following command:

```bash
docker push <your-dockerhub-username>/web-app:latest
```
Replace <your-dockerhub-username> with your Docker Hub username.
This command uploads the image to your Docker Hub repository.
Additional Information
Dockerfile: The Dockerfile defines the environment in which your web application will run. It includes instructions for setting up the web server and copying the application files (like index.html) into the image.
Docker Hub: Docker Hub is a cloud-based repository where Docker images are stored and shared. After pushing the image, it becomes accessible publicly or privately depending on your repository settings.
