#!/bin/bash

# Ensure that you're running the script from the root of the React Native project
echo "Starting deployment process..."

# 1. Install dependencies (ensure you're in the correct directory)
echo "Installing dependencies..."
npm install

# 2. Build the React Native app for Android (release version)
echo "Building React Native app for Android..."
cd android && ./gradlew assembleRelease

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Build failed! Please check the build logs."
  exit 1
fi

# 3. Locate the generated APK file
APK_PATH="./android/app/build/outputs/apk/release/app-release.apk"

# Check if the APK was created
if [ ! -f "$APK_PATH" ]; then
  echo "APK was not generated. Please check the build process."
  exit 1
fi

echo "APK built successfully: $APK_PATH"

# 4. Deploy the APK to a remote server (replace with your server details)
# Example using SCP to copy the APK to a remote server
echo "Deploying APK to remote server..."
scp $APK_PATH user@your-server:/path/to/deploy

# Check if the deployment was successful
if [ $? -ne 0 ]; then
  echo "Deployment failed! Please check the server connection and path."
  exit 1
fi

echo "Deployment complete! APK deployed successfully."

# 5. Optional: Clean up any build files
echo "Cleaning up build files..."
cd ..

echo "Deployment process finished!"
