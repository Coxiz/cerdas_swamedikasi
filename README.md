# Cerdas Swamedikasi - Flutter App

## Overview

Cerdas Swamedikasi is a Flutter mobile application that helps users perform self-medication safely and effectively. The app allows users to identify common illnesses based on their symptoms and provides appropriate medication recommendations.

## Features

1. **Main Menu**
   - Easy navigation to all app features
   - Clean and intuitive medical-themed UI

2. **Disease List**
   - Searchable list of common diseases
   - Quick access to details for each disease

3. **Symptom Selection**
   - Interactive checklist of symptoms for each disease
   - User can select specific symptoms they're experiencing

4. **Treatment Recommendations**
   - Personalized medication recommendations based on selected symptoms
   - Detailed information about dosage, frequency, and precautions
   - Additional advice and warnings
   - Option to copy recommendations for later reference

5. **App Information**
   - About page with app and developer information
   - Comprehensive user guide

## Technical Implementation

### Architecture

The app follows a clean architecture pattern using GetX for state management, routing, and dependency injection:

- **Data Layer**: Models and services for handling app data
- **UI Layer**: Modules with controllers and views
- **Global Components**: Reusable widgets for consistent UI

### State Management

GetX is used for reactive state management with:
- Observable variables (`Rx`)
- Dependency injection
- Route management
- Bindings for each module

### UI Components

The app includes several reusable components:
- Custom buttons
- Custom cards
- Search input
- Symptom checkboxes
- And more...

### Folder Structure

The app follows a modular organization:

```
lib/
├── app/
│   ├── bindings/
│   ├── config/
│   ├── controllers/
│   ├── data/
│   ├── global_widgets/
│   ├── modules/
│   ├── routes/
│   └── utils/
└── main.dart
```

## How to Run the Project

1. **Prerequisites**
   - Flutter SDK (version 3.5.4 or later)
   - Dart SDK (matching Flutter version)
   - Android Studio or VS Code with Flutter extensions

2. **Setup**
   - Clone the repository
   - Run `flutter pub get` to install dependencies
   - Create the following folders structure:
     ```
     assets/
     ├── fonts/
     │   ├── Poppins-Regular.ttf
     │   ├── Poppins-Medium.ttf
     │   ├── Poppins-SemiBold.ttf
     │   └── Poppins-Bold.ttf
     ├── images/
     └── data/
     ```
   - Download Poppins font files and place them in the assets/fonts folder

3. **Run the App**
   - Connect a device or start an emulator
   - Run `flutter run` from the project root

## Future Enhancements

Potential improvements for future versions:
- Firebase integration for remote data storage
- User accounts for saving medical history
- Dark mode support
- Localization for multiple languages
- Image recognition for symptoms
- Integration with telemedicine services
