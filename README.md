# Beauty weather app

A beautiful weather app built using flutter. Enjoy

![group_235](https://user-images.githubusercontent.com/23453229/164944386-38202c0b-e252-4ba2-b749-56c73aa845ca.png)

## Features
With the app you can achieve the following:
1. Get today's weather data
2. The next 5 days weather forecast of your location
3. Save and view your favourite location weather

## Architecture
The app is built using the ``Bloc archietcure`` and the following libraries:
- ``floor db``: used to store the weather information for offline support
-  ``dio`` : making requests to openweather
- ``geolocator``: to get coordinates of your current location

## Getting Started
Clone the app and run
```dart
flutter pub get
flutter run
```
To run the tests, use:
```dart
flutter test
```
