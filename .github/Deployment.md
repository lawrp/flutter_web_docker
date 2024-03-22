# Source Code Version Control Tools

## Approach 
My approach to using GitHub Actions for deploying my Flutter app to Firebase involved setting up a workflow YAML file with specific steps. Challenges included configuring the Firebase hosting deployment action and ensuring proper authentication and access to the Firebase project. The deployment part of the workflow utilizes the FirebaseExtended/action-hosting-deploy action with appropriate parameters such as repoToken, firebaseServiceAccount, channelId, and projectId, ensuring seamless deployment to Firebase Hosting upon successful build completion.

## Challenges

The workflows that are generated from running `firebase init hosting:github` within the Firebase CLI do not seem to work natively with flutter projects. I had to configure my own file, and I ended up just adding the deployment to the end of my build.yml workflow. The key was to add the last line `env: FIREBASE_CLI_EXPERIMENTS: webframeworks` , this allows the runner to have access to the webframework required to deploy the app. I also had to edit the firebase.json file that was generated upon running `firebase init hosting` to include the pathway to my web app build within my repo. 

## Link to my deployed web page

https://first-game-663f9.web.app/ 