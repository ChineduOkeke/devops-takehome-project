# LeafLink Take Home

Install dependencies with `poetry install`

Run the application with `poetry run python3 weather_app/app.py`



 Weather App - EKS Deployment

This project is a microservice that provides the weather in New York City when a GET `/weather` request is made. The application is containerized using Docker, and deployed to an AWS EKS cluster using Helm and GitHub Actions for continuous deployment.


Before you begin, ensure you have the following:

- AWS CLI installed and configured with necessary access to deploy to AWS.
- kubectl and Helm  installed.
- AWS EKS Cluster created and set up with necessary IAM roles.
- A GitHub repository where the project is hosted.

 AWS Setup

Ensure that your AWS EKS cluster is up and running.
 You'll need:
- AWS Access Key and Secret Key with necessary permissions to deploy to the EKS cluster.
- The kubectl configuration for your EKS cluster.

 Deployment

The application is set up to be deployed automatically using GitHub Actions. Follow the steps below to trigger the deployment pipeline.

 Steps to Deploy via GitHub Actions

1. Set Up GitHub Secrets

   You need to add the following GitHub Secrets in your repository.

   - AWS_ACCESS_KEY_ID: Your AWS access key.
   - AWS_SECRET_ACCESS_KEY: Your AWS secret access key.
   - AWS_DEFAULT_REGION : The region where your EKS cluster is located ( us-east-2)

2. Push Changes to Trigger Deployment

   Once your secrets are set up, any changes to the repository will trigger the GitHub Actions workflow to:
   - Build the Docker image.
   - Push the Docker image to Docker Hub or ECR.
   - Deploy the Helm chart to your AWS EKS cluster.

3. Monitor the Workflow

   Go to the Actions tab in your GitHub repository to monitor the deployment process. Each step will be logged, and you can verify if the deployment succeeded.

 To build the docker image, run:  docker build -t weather-app .

To run the docker container : docker run -d -e SECURE_WEATHER_API_KEY=weather-883d37bb24536f00b4r -p 8080:8080 weather-app
Since we will be pushing the Dockerfile into Github, for security reasons, am pasing the secured weather api-key on the run time instead of adding it to the Dockerfile.
 
