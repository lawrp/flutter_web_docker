# Written Report

## Introduction
Continuous Integration and Continuous Deployment (CI/CD) pipelines have become indispensable in modern software development practices. They offer a streamlined approach to software delivery, allowing teams to integrate code changes frequently and automatically deploy them to production environments. The significance of CI/CD pipelines lies in their ability to enhance collaboration among developers, improve code quality, and accelerate the delivery process. By automating the build, test, and deployment stages, CI/CD pipelines reduce the risk of errors and inconsistencies, ensuring that software updates are released reliably and efficiently. Furthermore, CI/CD pipelines enable teams to be more agile than ever before, iterate quickly on features, and respond promptly when necessary. In a world where innovation and time-to-market are crucial, CI/CD pipelines empower organizations to deliver high-quality software rapidly, thereby gaining a competitive edge in the market.

## DevContainer Environment
My Devcontainer is configured with the two following files:
1. [devcontainer.json](./.devcontainer/devcontainer.json)
2. [Dockerfile](./.devcontainer/Dockerfile)

### devcontainer.json
The devcontainer.json file is used in the context of Visual Studio Code's Remote - Containers extension. It allows developers to define and configure development environments using Docker containers directly within VS Code. Think of .json files in this context as a form of a setting file. Here is how my devcontainer.json is configured:

- `"name": "Existing Dockerfile"` - names the remote container.
- `"build": {"dockerfile": "Dockerfile"},` - tells the remote container extension that I'll be building a Docker container with a dockerfile named Dockerfile.
- `"postCreateCommand": "flutter packages get && flutter packages upgrade"` - this is a command that my container will execute from command line following its creation. This command ensures that I have all required flutter packages and that they are updated.
- `"customizations": {"vscode": {"extensions": ["Dart-Code.dart-code","Dart-Code.flutter","ms-azuretools.vscode-docker"]}}` - This setting installs the VS Code extensions in my remote container for development use. I chose to install the Dart, Flutter and Docker extensions for syntax highlighting and other quality of life improvements. 

### Dockerfile
My development environment for Flutter development is containerized using Docker, providing a consistent and reproducible setup across different development machines. Containerization of the development environment eliminates the "it works on my machine" problem by building a protable ISO that can be run on any machine that has the Docker Desktop Daemon installed. Docker images (ISOs) are the basis of containers. An image is a lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including the code, runtime, libraries, and dependencies. Docker images are built from a Dockerfile, which specifies the environment and dependencies needed for the application. Once an image is created, it can be stored in a registry, such as Docker Hub, and used to create Docker containers. The Dockerfile used to configure my container includes the following steps:

1. `FROM ubuntu:20.04` - This tells the container which operating system I'll be starting the build from. For this project I decided to use Ubuntu as its my favorite Linux distrubution.
2. `ENV DEBIAN_FRONTEND=noninteractive` - crucial step that allows me to skip past user prompts when installing packages that would otherwise halt my container's creation process.
3. `RUN apt-get update` - updates the package manager.
4. `RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback python3 npm clang cmake ninja-build pkg-config libgtk-3-dev  openjdk-11-jdk` - installs tools such as git, wget, unzip and others and also installs dependencies for Chrome and Linux toolchain.  
5. `RUN apt-get clean` - cleans the package repository.
6. `RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb` - downloads Google chrome.
7. `RUN apt-get install -y ./google-chrome-stable_current_amd64.deb` - installs Google chrome. 
8. `RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter` - clones the flutter repository into the flutter folder.
9. `ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"` - Adds the flutter SDK location to the Path variable of my container. This allows for the command line to recognize flutter commands.
10. `RUN npm install -g n && n latest && npm install -g firebase-tools` - installs the node package manager, updates it, and then installs the firebase CLI, which is necessary for my deployment method. 
11. `RUN flutter channel stable && flutter upgrade && flutter config --enable-web` - Sets the channel of flutter to stable, which is the least experimental version, upgrades flutter, and then enables web development which is necessary for my web app.  
12. `CMD ["/bin/bash"]` - opens my container with a bash terminal. 

The configuration of these files allows for the perfect development environment for my Flutter web app. 


## Source Code Version Control Tools
For my project, I've opted for Git as my version control system due to its widespread adoption, robust branching and merging capabilities, and seamless integration with various hosting platforms. Git's distributed nature allows for a flexible workflow, while its performance ensures efficient operations. Overall, Git provides the ideal solution for managing my project's source code and facilitating the possibility for effective collaboration in the future. 

As for my source code repository host, I've opted to use GitHub as it is the industry standard and GitHub's seamless integration with Visual Studio Code's Source Control feature makes it the perfect choice. With its integrated diff viewer and branch management capabilities, I can seamlessly navigate through my Git repository, review changes, and collaborate effectively without leaving the IDE. With one click of a button, I am able to commit the changes that are located in the staging tab to my remote repository. The tight integration enables effortless version control, enhancing productivity throughout the development lifecycle. 

The following features make GitHub the ideal choice for development:

- **Repository Management:** GitHub allows me to create cloud repositories to store my project's source code securely.
- **Branching and Merging:** With GitHub, I can create branches to work on new features or bug fixes, and then merge them back into the main codebase seamlessly.
- **Version History:** GitHub maintains a comprehensive history of all changes made to the codebase, enabling me to track the evolution of my project over time.
- **Collaboration:** GitHub allows for potential collaboration among team members by providing mechanisms for code review, commenting, and resolving conflicts.

## CI/CD Pipeline Environment

My pipeline can be found in my build.yml file. Here's how it works:

### Structure
- **Trigger** - The workflow is triggered by a push event on the master branch.
- **Path Ignores** - The workflow ignores changes to YAML, Markdown, and TXT files to prevent unnecessary builds triggered by non-code changes.
### Code Retreival and Configuration
- The workflow runs on an Ubuntu-latest runner environment.
- The source code is checked out from the repository using `actions/checkout@v4`.
- Flutter SDK is configured using `subosito/flutter-action@v2`.
- Dependencies are installed using `flutter pub get`.
### Test
- Tests are executed using `flutter test`.
### Build
- The Flutter web application is built using `flutter build web`.
### Deployment
- The built artifacts are deployed to Firebase Hosting using `FirebaseExtended/action-hosting-deploy@v0`.
- The deployment is authenticated using the repository token stored in `${{ secrets.GITHUB_TOKEN }}`.
- The Firebase service account key is securely accessed from `${{ secrets.FIREBASE_SERVICE_ACCOUNT_FIRST_GAME_663F9 }}`.
- Deployment settings such as `channelId` and `projectId` are configured accordingly.
- Additionally, the `FIREBASE_CLI_EXPERIMENTS` environment variable is set to `webframeworks` to enable experimental features related to web frameworks.


## CI/CD Tools
My CI/CD pipeline operates within a cloud-based environment leveraging GitHub Actions. GitHub Actions excels in automating the build, test, and deployment processes by seamlessly integrating with my GitHub repository. Its flexibility allows for the creation of a customized workflow tailored to the project requirements. With automated triggers on events like pushes and pull-requests, GitHub Actions makes the entire pipeline possible and is the tool of choice for this project. 

## Deployment Environment
Google's Firebase Hosting is my chosen platform for hosting my web application. It offers a secure and reliable hosting environment with features like automatic SSL certificate provisioning, CDN integration, and rollback capabilities. To configure my web app deployment I took the following steps:

1. Firebase Project Creation: I Began by creating a Firebase project via the Google Firebase console and linked it with my GitHub repository for seamless integration.
2. Firebase CLI Installation: I Installed the Firebase Command Line Interface (CLI) globally on my development machine using npm from command line. `npm install -g firebase-tools`
3. Firebase Configuration: Initialize Firebase within your Flutter project directory by running: `firebase init:hosting` then linking my flutter web build. This created an automatic workflow to go in my GitHub Actions workflow directory. This also generated my secret token that is used in my workflow. In order to ensure that I had one workflow, I incorporated the deployment commands into my already existing build workflow. 

The beauty of Google Firebase hosting is the availability of analytics and customization within the firebase console. For example, I could use Firebase to host to a custom domain if I wished to purchase one. However I decided not to do so.
### Link to my deployed web page.
https://first-game-663f9.web.app/


## Flutter Web Application
I aimed to maintain simplicity in the design of the web application to prioritize the seamless integration with the CI/CD pipeline, while simultaneously leveraging the project as an opportunity to delve into Flutter and expand my knowledge of the framework. 

### Functionality
I modeled my web app after the classic arcade stacker game. The game can be broken down into winning and losing conditions:

**Winning Condition:** The player wins the game by successfully stacking each row of blocks to reach the top of the playing area. This involves aligning each block precisely on top of the previous one to build a complete tower. Upon reaching the top row, the player wins the game.

**Losing Condition:** The player loses the game if they fail to stack a block correctly, causing it to overhang or fall off the platform. Additionally, if the player misses the stacking zone entirely, the game ends in defeat.

There are three main custom classes used in this web app:

1. [homepage](./lib/homepage.dart) - This class contains almost all of the game logic and the structure of how the objects appear on screen. 
2. [button](./lib/button.dart) - This class is used to create the two button objects that appear at the bottom of the canvas. "Play" is used to start the game and "Stop" is used to stop the blocks at the current position and move to the next level. 
3. [pixel](./lib/pixel.dart) - This class is used to create the block objects that appear on the screen. When the blocks turn white, they are the current position that will be picked when the player hits "Stop".

### Testing

This smoke test verifies that the UI components of the HomePage widget are rendered correctly by using the Flutter testing framework. It ensures that both the 'P L A Y' and 'S T O P' texts are displayed on the buttons by expecting to find them using the find.text matcher. This test ensures that the essential UI elements required for user interaction in the HomePage widget are present and visible, validating the expected behavior of the widget. Due to most of my game logic being in a private class, I was actually unable to test most of it without extrapolating it out into a public class. 

### Development Challenges

The hardest part of creating this web app was learning the basics of the Flutter framework. Essentially elements of the UI are layered or "wrapped" within each other using a child and parent structure. However, the hot reload feature made testing UI elements extremely easy compared to other app development I have done. An issue with the current implementation that still exists is the lack of resizing based on the size of the device. Currently, my web app still requires scrolling on certain devices, which makes for a very annoying experience. I tried messing around with the MediaQuery class which is able to capture the size and dimensions of the current device, but I was unable to get this up and running. 

## Conclusion
Reflecting on the project, several key lessons were learned, alongside encountered challenges and potential improvements for both the pipeline and application:

### Containerization
 I was familiar with the concept of containerization before this project, however I had no experience building a container in any context. This project taught me the ins and outs of building Docker containers. This section proved to be the most challenging due to the intricacies of Docker. For instance, my method for creating a developer role within my Dev Container to restrict root access worked at first, but then started creating complex permission errors not solvable with sudo chmod/chown and I ultimately decided to scrap this feature. That being said, I enjoyed the process of learning about containerization and I plan to make it a habit in future development projects. 

 ### Flutter/Dart App Development
 This project served as an invaluable learning experience for Flutter and Dart. I planned on making a more complex app for this project, but the language was a bit more complex than expected at first. I did enjoy learning it though and plan on creating new games with Flutter in the future. 

 ### CI/CD Pipeline 
 This was the first automated CI/CD pipeline I have created and I was unfamiliar with the process before this project. However, GitHub Actions made the process of setting up the build and test parts of the pipeline extremely simple. I did have a bit of issue setting up the deployment to firebase hosting. I had a ton of failed deployments due to not setting the `FIREBASE_CLI_EXPERIMENTS` to `webframeworks`. After searching Stack Overflow for an extended period of time I eventually was able to solve the issue and deploy my flutter web app. 

 This project taught me the importance and convenience of continuous integration and deployment. With these tools and a foundation in my arsenal, I look forward to exploring other forms of pipeline creation in the future. 