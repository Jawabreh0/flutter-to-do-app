# Flutter To-Do App with SQLite and Biometric Authentication

This is a Flutter-based To-Do App that allows users to create, edit, and delete tasks, set due dates, and secure access with biometric authentication. The app uses SQLite for task storage, ensuring data persistence across sessions.

## Features

- **Biometric Authentication**: Secure your tasks with biometric authentication on the login page for added privacy and security.

- **Task Management**: Easily create, edit, and delete tasks. Each task can have a title, description, and due date.

- **SQLite Database**: Store your tasks locally using SQLite, ensuring data is saved even when the app is closed.

## App Design

Here is the application Figma design. [Check it out if you're interested](https://www.figma.com/file/7qccpxvr08wUB6XkfIeUa1/pcnc-todo-task?type=design&node-id=0-1&mode=design&t=ZeV0vFZOB5QkT18I-0).


## Getting Started

Follow these steps to get the app up and running on your local development environment:

1. **Clone the Repository**:

```bash
   git clone https://github.com/Jawabreh0/To-Do-App.git
```
2. **Install Dependencies**: 
 ```bash
  flutter pub get
 ```
3. **Run The App**:
  ```bash
  flutter run
 ```
Make sure you have Flutter and Dart installed on your machine.

## Dependencies
List the major dependencies your project uses. For example:

- sqflite: A Flutter plugin for SQLite, used for local task storage.
- local_auth: A Flutter plugin for secure biometric authentication.
- flutter_svg: A flutter plugin for SVG files, we use SVG icons in the app so this package is need to deal with the icons 
- get: GetX package 

## Contributing
If you'd like to contribute to this project, please follow these guidelines:

Fork the repository.
Create a new branch for your feature or bug fix.
Make your changes and test thoroughly.
Submit a pull reques.

## License
This project is licensed under the MIT License.

