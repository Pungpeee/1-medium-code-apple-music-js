# # Use an official Node.js runtime as a parent image
# FROM node:18-alpine

# # Set the working directory inside the container
# WORKDIR /app

# # Copy package.json and package-lock.json to the working directory
# COPY package*.json /app
# ENV NODE_OPTIONS=--openssl-legacy-provider

# # Install dependencies
# # RUN npm update
# RUN npm install --frozen-lockfile --save-dev ajv@^7 

# # Copy the entire project to the working directory
# COPY . /app

# # RUN npm run build

# # Expose the application's port
# EXPOSE 3000

# # Define the command to run the application
# CMD ["npm", "start"]

#------------------------------------------------------------------------------------
# Stage 1: Install dependencies
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json /app
RUN npm install --frozen-lockfile --save-dev ajv@^7

# Stage 2: Build application
FROM node:18-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . /app
# Uncomment below to run build in the Dockerfile
# RUN npm run build

# Stage 3: Production runtime
FROM node:18-alpine AS runtime
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 3000
CMD ["npm", "start"]
