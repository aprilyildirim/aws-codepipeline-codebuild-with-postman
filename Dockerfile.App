FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget libgtk2.0-0 libcanberra-gtk-module libx11-xcb-dev libxcb-dri3-dev libxtst-dev libgconf-2-4 libnss3 libasound2 libxtst6 xauth xvfb

# Install Postman
RUN wget -O /tmp/Postman.tar.gz https://dl.pstmn.io/download/latest/linux64 && \
    tar -xzf /tmp/Postman.tar.gz -C /opt && \
    rm /tmp/Postman.tar.gz
    
# Expose Postman to the host system
EXPOSE 8080

# Start Postman
CMD ["xvfb-run", "-a", "/opt/Postman/app/Postman"]
