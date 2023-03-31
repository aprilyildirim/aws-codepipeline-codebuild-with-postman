FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y curl && \
    curl -L https://dl.pstmn.io/download/latest/linux64 -o postman.tar.gz && \
    tar -xzf postman.tar.gz -C /opt && \
    rm postman.tar.gz && \
    ln -s /opt/Postman/Postman /usr/bin/postman
    
WORKDIR /app
COPY . .

CMD ["postman"]
