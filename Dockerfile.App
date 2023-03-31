FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    libglib2.0-0 \
    libgtk-3-0 \
    libnotify4 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils

# Install Postman
RUN curl -L https://dl.pstmn.io/download/latest/linux -o postman.tar.gz \
    && tar -xzf postman.tar.gz -C /opt \
    && rm postman.tar.gz \
    && ln -s /opt/Postman/Postman /usr/bin/postman

CMD ["postman"]
