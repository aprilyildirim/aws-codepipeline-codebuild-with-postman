FROM ubuntu:latest

# Install required packages
RUN apt-get update \
    && apt-get install -y \
       curl \
       wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Download and install the latest version of Postman
#RUN https://dl.pstmn.io/download/latest/linux64 postman.tar.gz \
RUN curl -o- "https://dl-cli.pstmn.io/install/linux64.sh" | sh \
    && mv postman-cli.tar.gz postman.tar.gz
    && tar -xzf postman.tar.gz \
    && rm postman.tar.gz \
    && mv Postman /opt/Postman \
    && ln -s /opt/Postman/Postman /usr/bin/postman

# Set the working directory
WORKDIR /app

# Copy the Postman files to the container
COPY collection.json /
COPY environment.json /

# Add environment variables
ENV POSTMAN_COLLECTION_PATH=/collection.json
ENV POSTMAN_ENVIRONMENT_PATH=/environment.json

# Expose the port that Postman will use
EXPOSE 3000

# Define the command to start Postman
CMD ["postman"]



