## DevContainer Environment

**Contains:**
1. [devcontainer.json](./devcontainer.json) 
2. [Dockerfile](./Dockerfile)

**PURPOSE** 

A DevContainer is a portable and isolated environment for software development, ensuring consistency across different machines and platforms by encapsulating project dependencies and configurations. Its purpose is to streamline development workflows, enhance collaboration, and facilitate reproducible builds by providing a consistent and reproducible environment for developers to work on projects.

**Configuration**

This Dockerfile sets up an Ubuntu 20.04 environment, installs necessary dependencies including Google Chrome, Flutter SDK, and other tools. It configures Flutter for web development, clones a Flutter project, builds it for the web, and then starts a server using a startup script.


**VS Code Integration** 

This image can reopened directly from VS Code on your local machine. This can be done with the "Dev Container", "Docker", or "Remote Development" extensions. The devcontainer.json file is set up to preload two extensions in the container environment: These are the Dart and Flutter VS Code extensions for syntax highlighting. 

**Usage**

To integrate this DevContainer into your workflow, open your project in Visual Studio Code, select "Open in Container," then edit code, run Flutter applications, and maintain consistency in development environments effortlessly.

**Challenges and Solutions**

Faced with the challenge of having to constantly update dependencies on startup, a postCreateCommand of `flutter packages get && flutter packages upgrade` was added to avoid this issue.

**Conclusion**

By encapsulating project dependencies and configurations, DevContainers simplify the setup process and ensure a consistent development experience, ultimately improving productivity and project maintainability.






