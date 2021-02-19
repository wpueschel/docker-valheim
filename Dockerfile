FROM debian:buster

# Install Packages
RUN echo "***** Installing necessary Packages" && \
    apt-get update && apt-get upgrade -y && \
    apt-get install lib32gcc1 lib32stdc++6 wget -y

# Add steamcmd
RUN echo "***** Installing steamcmd" && \
    mkdir /Steam && \
    wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /Steam/steamcmd_linux.tar.gz && \
    tar -xzf /Steam/steamcmd_linux.tar.gz -C /Steam

# Add start script
COPY start.sh /

ENTRYPOINT [ "/start.sh" ]
