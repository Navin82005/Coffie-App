# Coffee App ☕️

A sleek and user-friendly Flutter-based application for selecting and customizing coffee beverages. This app showcases the integration of GetX for state management, advanced widgets, and custom components for enhanced user experience.

## Features ✨

- **Beverage Selection**: Browse a wide range of coffee beverages, each with detailed descriptions and customizable options.
- **Customization**: Choose options such as milk type, sugar level, and cup filling, dynamically rendered using Flutter widgets like `GridView` and custom switch widgets.
- **State Management**: Managed with GetX for efficient state handling and updating the UI reactively.
- **Advanced Widgets**: Includes advanced switches and custom components for an intuitive user interface.
- **Rating System**: View beverage ratings with a custom `RatingWidget`.

## Getting Started 🚀

To run this application, you will need to have Flutter installed on your local machine. Follow the steps below:

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code with Flutter plugins.
- Dart SDK (comes with Flutter).

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Navin82005/Coffie-App.git

2. Navigate to the project directory:

   ```bash
   cd coffieapp

3. Install dependencies:

   ```bash
   flutter pub get

4. Run the app:

   ```bash
   flutter run

## Project Structure 🏗️

   ```bach
   lib/
   │
   ├── controller/
   │   └── beverage.controller.dart     # Handles the state management for beverages
   │
   ├── model/
   │   └── beverages.model.dart         # Beverage model defining coffee attributes
   │
   ├── view/
   │   ├── product/
   │   │   ├── choice_of_filling.product.dart   # Widget to handle cup filling choices
   │   │   └── choice_of_milk.product.dart      # Widget for choosing milk type
   │   │
   │   └── common/
   │       └── rating_widget.common.dart  # Common widget for displaying ratings
   │
   ├── main.dart                         # Main entry point of the app
   ```

## Main Components 📱
### 1. Beverage Model
   The Beverage model holds information about each beverage, such as name, description, image path, rating, etc.

### 2. Beverage Controller
   The BeverageController manages the list of beverages and their selected customizations using GetX for reactive state management.

### 3. Customization Widgets
   ChoiceOfFilling: Allows users to select how they want their cup filled.
   ChoiceOfMilkSection: Provides users with the option to select the type of milk (e.g., soy milk, skim milk).
   RatingWidget: Displays the rating of each beverage.

Example Screenshots 📸



## Contributing 🤝
Feel free to contribute to this project by submitting issues, pull requests, or suggesting new features. We welcome all kinds of contributions to improve the app!

## License 📝
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments 🙌
Flutter for providing an amazing framework.
GetX for simplifying state management.
Flutter Advanced Switch for the custom switches.

## Contact
If you have any questions or suggestions, feel free to reach out to me at navin82005@gmail.com
