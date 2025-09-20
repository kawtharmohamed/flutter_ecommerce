# e_commerce_app

A new Flutter project.

# Setup Instructions
Install dependencies using `flutter pub get`
Run the app using `flutter run`
I created a new repository on GitHub, then initialized Git in my project, made the first commit, and pushed the code to the repository.  
Now the project is available publicly on GitHub.

# API Endpoints
GET https://fakestoreapi.com/products fetch products
GET https://fakestoreapi.com/products/categories fetch categories

# Folder structure explanation.

The project is organized using a feature-first + clean architecture approach:

core/ → Shared modules used across the app

db/ → Local database setup
di/ → Dependency injection configuration
helpers/ → Utility functions
localization/ → Language support with Easy Localization
networking/ → API client and configuration
routing/ → Navigation setup
theming/ → Colors, theme, styles
widges/ → Reusable common widgets


features/ → Each feature is isolated and follows data → domain → presentation layers:

data/ → API models, mappers, and repositories
domain/ → Entities, use cases, repository interfaces
presentation/ → UI (pages, widgets) and Cubit state management

assets/ → App resources
images/ → App images
translations/ → Localization files (en.json, ar.json)

main.dart → Entry point of the application
# State Management Reasoning

This project uses Cubit (from the `flutter_bloc` package) for state management.

# Why Cubit?
Simplicity: Cubit provides a lightweight way to manage state
Scalability: Easy to scale as the app grows into more features ( Cart, Products, Categories).
Readability: Code remains clean and organized, separating UI from business logic.
Reactivity: The UI automatically rebuilds when states change (when products load, items are added/removed from the cart).


# build files
flutter pub run build_runner build --delete-conflicting-outputs
dart run easy_localization:generate -S assets/translations -O lib/core/localization -f keys -o locale_keys.g.dart


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
