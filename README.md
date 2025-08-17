# Flutter Authentication App

## Overview

This Flutter application is a sleek, modern authentication app featuring a Sign-In and Sign-Up system with local storage using Hive. It provides a dynamic, animated user interface with glassmorphic card designs, animated text fields, and hover effects for buttons.

## Features

* **User Authentication:** Sign-In and Sign-Up functionality with local Hive database.
* **Animated UI:** Smooth transitions between Sign-In and Sign-Up using card flip animation.
* **Glassmorphic Design:** Cards have semi-transparent backgrounds with shadow effects.
* **Animated Text Fields:** Slide-in animation for input fields.
* **Hover Effects:** Buttons have hover animations for better interactivity.
* **Counter Feature:** Home page includes a counter with Add, Remove, and Reset buttons.
* **Responsive Design:** UI adapts to different screen sizes.

## Folder Structure

```
flutter_auth_app/
│
├── lib/
│   ├── main.dart                # Entry point of the application
│   ├── data/
│   │   └── user_repo.dart       # User repository for Hive operations
│   ├── pages/
│   │   └── home_page.dart       # Home page with counter and navigation
│   └── widgets/
│       ├── animated_text_field.dart
│       ├── card_container.dart
│       ├── hover_fill_button.dart
│       ├── sign_in_card.dart
│       └── sign_up_card.dart
│
├── assets/
│   └── B_image.jpg              # Background image
│
└── pubspec.yaml                 # Project dependencies and assets
```

## Installation

1. Ensure you have Flutter installed on your system.
2. Clone the repository:

   ```bash
   git clone <repository-url>
   cd flutter_auth_app
   ```
3. Install dependencies:

   ```bash
   flutter pub get
   ```
4. Run the app:

   ```bash
   flutter run
   ```

## Dependencies

* `flutter`
* `hive` and `hive_flutter` for local data storage
* `google_fonts` for typography
* `path_provider` for Hive directory access

## Usage

1. Launch the app.
2. Use the Sign-Up page to register a new user.
3. Switch to Sign-In and log in with registered credentials.
4. After login, access the Home Page with counter functionalities.
5. Logout using the button in the top-right AppBar.

