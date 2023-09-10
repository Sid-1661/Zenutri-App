# zenutri_app

The primary objective of this app is to offer users an intuitive, seamless, personalized vitamin selection experience.

## Project Configuration

flutter version : 3.10.6

### Set up
1. Clone the application from git.
2. Run the command
  `` flutter pub get ``
3. Open emulator or simulator
4. Select the device and run the project

## Project architecture
We are following feature-first architecture. And inside feature you will find the layering
architecture with BLoC, clean architecture and other clean code practices.

```
zenutri_app
├── application
├── common
│   ├── data
│   │   ├── models
│   │   └── repositories
│   ├── domain
│   │   └── entities  
│   └── presentation
│       ├── blocs
│       └── ui
│           ├── screens
│           ├── widgets
│           └── utils
├── features
│   └── fetureA
│       ├── data
│       │   ├── models
│       │   └── repositories
│       ├── domain
│       │   └── entities  
│       └── presentation
│           ├── blocs
│           └── ui
│               ├── screens
│               ├── widgets
│               └── utils
└── main.dart
```
## Packages
Before you start contribute to this project, you need to know bloc, repository pattern, equatable and dartz.