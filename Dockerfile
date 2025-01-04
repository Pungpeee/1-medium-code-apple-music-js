# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install ajv@latest ajv-keywords@latest

# Copy the entire project to the working directory
COPY . .

# Expose the application's port
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
