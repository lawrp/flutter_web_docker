# CI/CD Pipeline


## CI/CD Pipeline Environment:
Our CI/CD pipeline operates within a cloud-based environment leveraging GitHub Actions integrated with Firebase hosting. This setup provides a seamless integration between our code repository on GitHub and the deployment platform on Firebase. The infrastructure comprises the following key components:

- GitHub Repository: This is where my project's source code resides. GitHub provides version control, collaboration features, and integration capabilities with CI/CD tools like GitHub Actions.

- GitHub Actions: GitHub Actions serves as the backbone of my CI/CD pipeline. It provides a platform for automating workflows directly from my GitHub repository. With GitHub Actions, I can define custom workflows to build, test, and deploy my application using GitHub Linux runners. 

- Firebase Hosting: Firebase Hosting is my chosen platform for hosting my web application. It offers a secure and reliable hosting environment with features like automatic SSL certificate provisioning, CDN integration, and rollback capabilities.

## Process for Automating Build and Deployment Phases of CI/CD Pipeline:

### Triggering Workflow:

The workflow is triggered on pushes to the "master" branch, ensuring that changes to the main codebase initiate the CI/CD pipeline.

### Code Compilation:

- The workflow runs on an Ubuntu-latest runner environment.
- The source code is checked out from the repository using `actions/checkout@v4`.
- Flutter SDK is configured using `subosito/flutter-action@v2`.
- Dependencies are installed using `flutter pub get`.
- Unit tests are executed using `flutter test`.


### Deployment:

- The Flutter web application is built using `flutter build web`.
- The built artifacts are deployed to Firebase Hosting using `FirebaseExtended/action-hosting-deploy@v0`.
- The deployment is authenticated using the repository token stored in `${{ secrets.GITHUB_TOKEN }}`.
- The Firebase service account key is securely accessed from `${{ secrets.FIREBASE_SERVICE_ACCOUNT_FIRST_GAME_663F9 }}`.
- Deployment settings such as `channelId` and `projectId` are configured accordingly.
- Additionally, the `FIREBASE_CLI_EXPERIMENTS` environment variable is set to `webframeworks` to enable experimental features related to web frameworks.