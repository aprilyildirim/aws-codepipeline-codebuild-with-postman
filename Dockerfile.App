FROM ubuntu:latest

RUN apt-get update && apt-get install -y nodejs npm git
RUN npm install -g newman
RUN npm install -g newman-report-html

# Set working directory
WORKDIR /app
COPY . .

# Run Newman
#CMD ["newman", "run", “PetStoreAPI.postman_collection.json", "-e", "PetStoreAPIEnvironment.postman_environment.json", "-r", "html"]
CMD ["newman", "run", “PetStoreAPI.postman_collection.json"]
