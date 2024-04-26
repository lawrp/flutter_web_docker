# Install Operating system and dependencies
FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3 npm clang cmake ninja-build pkg-config libgtk-3-dev  openjdk-11-jdk
RUN apt-get clean
RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y ./google-chrome-stable_current_amd64.deb

ENV DEBIAN_FRONTEND=dialog
# download Flutter SDK from Flutter Github repo
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

# Set flutter environment path
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

#Install Firebase CLI
RUN npm install -g n
RUN n latest
RUN npm install -g firebase-tools


# Enable flutter web
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

CMD ["/bin/bash"]