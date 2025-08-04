#!/bin/bash
# Script to help with Render deployment preparation

echo "Preparing Excel Splitter for Render deployment..."

# Ensure we have the required files
if [ ! -f "render.yaml" ]; then
  echo "Error: render.yaml not found!"
  exit 1
fi

if [ ! -f "Dockerfile" ]; then
  echo "Error: Dockerfile not found!"
  exit 1
fi

# Check if git is initialized
if [ ! -d ".git" ]; then
  echo "Initializing git repository..."
  git init
  git add .
  git commit -m "Initial commit for Render deployment"
  echo "Git repository initialized."
  echo "Next steps:"
  echo "1. Create a repository on GitHub/GitLab/Bitbucket"
  echo "2. Add the remote: git remote add origin <your-repo-url>"
  echo "3. Push your code: git push -u origin main"
else
  echo "Git repository already initialized."
  echo "Make sure to commit your changes:"
  echo "git add ."
  echo "git commit -m \"Prepare for Render deployment\""
  echo "git push"
fi

echo ""
echo "Render deployment preparation complete!"
echo "Follow these steps to deploy:"
echo "1. Push your code to your Git repository"
echo "2. Log in to Render (https://render.com)"
echo "3. Create a new Web Service and connect your repository"
echo "4. Select Docker as the environment"
echo "5. Add a disk with mount path /app/uploads"
echo "6. Click Create Web Service"
echo ""
echo "Your application will be available at the URL provided by Render"
