# Source Code Version Control Tools

## Introduction
Version control is a crucial aspect of software development, enabling teams to manage changes to their codebase efficiently. It provides a systematic way to track revisions, manage collaboration, and ensure the integrity and stability of the project over time. In my project, version control plays a fundamental role in maintaining the project's history, allowing for collaboration, and ensuring the reliability of our software.

**Integrity:**
Version control ensures the integrity of a project by keeping a detailed record of every change made to the codebase. This means that developers can always access previous versions of the code, providing a safety net in case of errors or unintended changes. Additionally, version control systems often include features such as branching and merging, which allow developers to work on separate features or fixes without interfering with each other's work. This helps to prevent conflicts and ensures that the codebase remains stable and consistent.

**History:**
One of the most significant advantages of version control is its ability to maintain a complete history of the project. Every change, whether it's a bug fix, a new feature, or a refactor, is recorded along with information about who made the change and when it was made. This historical record is invaluable for understanding the evolution of the project over time, diagnosing issues, and auditing changes.

**Collaboration:**
Version control facilitates collaboration among team members by providing a centralized repository where developers can share and collaborate on code. Features such as branching, merging, and pull requests enable seamless collaboration, allowing developers to work together on different parts of the project simultaneously. Pull requests, in particular, provide a mechanism for code review and feedback, ensuring that changes meet the project's standards and requirements before being merged into the main codebase. This collaborative workflow fosters communication, improves code quality, and accelerates the development process.

## Version Control System Used
For my project, I've opted for Git as my version control system due to its widespread adoption, robust branching and merging capabilities, and seamless integration with various hosting platforms. Git's distributed nature allows for a flexible workflow, while its performance ensures efficient operations. Overall, Git provides the ideal solution for managing our project's source code and facilitating the possibility for effective collaboration in the future. 

## Repository Setup

The repository is complete with the following folders:

- **[.devcontainer](/.devcontainer)** - Contains the devcontainer.json file as well as the Dockerfile used to containerize the web app. Also features documentation.
- **[.github](/.github)** - Contains the build.yml file used to maintain the CI/CD pipeline, which is done with GitHub Actions along with Version Control documentation.
- **[Android](/Android)** - Contains the required files to build on Android devices.
- **[iOS](/iOS)** - Contains the required files to build on iOS devices.
- **[Linux](/Linux)** - Contains the required files to build on Linux devices.
- **[macos](/macos)** - Contains the required files to build on macos devices.
- **[web](/web)** - Contains the required files to build the web application.
- **[Windows](/Windows)** - Contains the required files to build on Windows devices.
- **[lib](/lib)** - Serves as the primary location for storing the Dart source code files.
- **[test](/test)** - Serves as the designated location for writing and organizing tests for the Dart codebase.
- **[build](/build)** - Contains the compiled output of my Flutter application. Output of `flutter build` commands. 

## Common Commands and Usage

- **git clone** - used to clone the Flutter SDK into my repo
- **git status** - Check the status of your working directory and staging area.
- **git add** - Stage changes to commit from local to remote
- **git commit** - Record changes to the repository.
- **git push** - Upload local repository content to a remote repository.
- **git pull** -  Fetch from and integrate with another repository or a local branch.
- **git checkout** - Switch branches or restore working tree files. Used in my GitHub Actions build.yml

## Collaboration Features:

- **Pull Requests (PRs):** Pull requests are a fundamental feature of Git-based collaboration workflows. They allow team members to propose changes to the codebase by creating a pull request from their feature branch to the main branch. PRs provide a mechanism for code review and discussion before merging changes into the main codebase. This process helps ensure that code changes meet quality standards, adhere to coding conventions, and align with project requirements.

- **Code Reviews:** Code reviews are an essential part of the pull request process. Before a pull request is merged, team members review the proposed changes, providing feedback, suggestions, and identifying potential issues or improvements. Code reviews help maintain code quality, identify bugs or logical errors, promote knowledge sharing among team members, and ensure consistency across the codebase. Git platforms like GitHub and GitLab provide built-in tools for conducting code reviews, making the process efficient and collaborative.

- **Branching and Merging:** Git's branching and merging capabilities enable parallel development and seamless collaboration among team members. Each developer can work on their feature or bug fix in a separate branch, allowing them to work independently without interfering with each other's code. Once changes are ready, branches can be merged into the main branch using merge or rebase operations. Git's merging algorithms automatically handle most conflicts that arise during the merge process, simplifying collaboration and reducing the risk of conflicts.

- **Conflict Resolution:** Despite best efforts to work in isolation, conflicts may arise when merging changes from different branches. Git provides robust tools for resolving conflicts, allowing developers to manually resolve conflicting changes by editing the affected files. Git's interactive conflict resolution tools help identify conflicting changes, choose between different versions of conflicting code, and reconcile differences between branches. By resolving conflicts collaboratively, team members can ensure that changes are integrated smoothly and without compromising code quality or stability.

## Challenges and Solutions

I did not face many challenges due to the built-in Source Control feature in VS Code streamlining the Git workflow by providing an intuitive interface for common Git operations such as staging, committing, and pushing changes. With its integrated diff viewer and branch management capabilities, I can seamlessly navigate through my Git repository, review changes, and collaborate effectively without leaving the IDE. With one click of a button, I am able to commit the changes that are located in the staging tab and my build.yml through the use of GitHub Actions will test and build those new changes. 


## Conclusion

In summary, the implementation of Git as my version control system has significantly improved the possibility of collaboration, code integrity, and workflow flexibility within my project. By leveraging Git's robust features such as pull requests, code reviews, and branching, I've fostered the capability for efficient teamwork, preserved a comprehensive history of changes, and maintained a seamless development process. Moving forward, I will continue to capitalize on Git's capabilities to drive continuous improvement and deliver high-quality software products effectively.