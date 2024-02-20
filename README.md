# flutter_web_docker

This Docker container is designed to facilitate the development and testing of Flutter web applications. It includes the necessary tools and configurations for running Flutter web apps inside a containerized environment.

Files
1. Dockerfile
The Dockerfile defines the steps to create the Docker image. It installs necessary dependencies, sets up the Flutter environment, and configures the container.

2. devcontainer.json
The devcontainer.json file is used by Visual Studio Code's Remote - Containers extension. It specifies container settings and extensions for the development environment.

3. server.sh
The server.sh (located in the server folder) script hosts a simple local live server to serve the Flutter web app. You can customize this script based on your project's requirements.

To use: clone the repository, build and run the docker image, then you can either develop your app or test it by running server.sh.  