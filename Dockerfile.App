# Use Ubuntu as base image
FROM ubuntu:latest

# Update packages and install dependencies
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    git

# Install Newman
RUN npm install -g newman

# Set working directory
WORKDIR /app
COPY . .

# Run Newman
CMD ["newman", "run", “PetStoreAPI.postman_collection.json"]
