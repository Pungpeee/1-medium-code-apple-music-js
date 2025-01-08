# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json /app
ENV NODE_OPTIONS=--openssl-legacy-provider

# Install dependencies
# RUN npm update
RUN npm install --frozen-lockfile --save-dev ajv@^7 

# Copy the entire project to the working directory
COPY . /app

# RUN npm run build

# Expose the application's port
EXPOSE 3000

# Define the command to run the application
CMD ["npm", "start"]
