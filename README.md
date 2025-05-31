# Movies App 🎬

## Overview
Movies App is a modern Flutter application that provides users with a comprehensive movie browsing and discovery experience. The app features a clean architecture, responsive design, and seamless user experience.

---

## 🎥 Demo Video

[![Watch the demo]](https://drive.google.com/file/d/134mBgnoH2tzGDj8zHw-n1D5ylyFCwvKO/view?usp=sharing)

---

## Features
- Browse popular and trending movies
- View detailed movie information
- Save favorite movies locally
- Responsive design that works on all screen sizes
- Dark/Light theme support
- Firebase integration for enhanced functionality

## Project Architecture
The project follows a clean and organized architecture:

```
lib/
├── models/         # Data models
├── services/       # Business logic and API services
├── layout/         # Main app layout components
├── moduls/         # Feature modules
│   ├── home/      # Home screen and related features
│   ├── splash/    # Splash screen
│   └── ...
└── main.dart       # Application entry point
```

## Technical Stack
- Flutter SDK
- Firebase
- Hive for local storage
- ScreenUtil for responsive design
- Material Design components

## Getting Started
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Configure Firebase (if needed)
4. Run the app using `flutter run`

## Dependencies
Key packages used in this project:
- flutter_screenutil: For responsive UI
- hive: For local storage
- firebase_core: For Firebase integration
- Material Design components for UI

## Contributing
Feel free to contribute to this project by:
1. Forking the repository
2. Creating your feature branch
3. Committing your changes
4. Pushing to the branch
5. Creating a new Pull Request

## License
This project is licensed under the MIT License - see the LICENSE file for details
