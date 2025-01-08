# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json /usr/src/app
ENV NODE_OPTIONS=--openssl-legacy-provider

# Install dependencies
RUN npm install --frozen-lockfile

# Copy the entire project to the working directory
COPY . ./app

# Expose the application's port
EXPOSE 8080

# Define the command to run the application
CMD ["npm", "start"]
