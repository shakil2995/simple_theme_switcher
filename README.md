# Simple Theme Switcher

A lightweight Flutter package for easily switching between light and dark themes with minimal setup. Built with `flutter_bloc` for efficient state management, this package helps developers implement theme toggling quickly.

---

## Features
- Simple and intuitive theme management.
- Toggle between light and dark themes.
- Minimal configuration required.

---

## Installation

Add `simple_theme_switcher` to your `pubspec.yaml`:
```yaml
dependencies:
  simple_theme_switcher: ^0.0.1
```

Run the following command:
```bash
flutter pub get
```

---

## Usage

### Step 1: Wrap Your App with `STMaterialApp`
In your `main.dart` file, use `STMaterialApp` as the root widget of your app:

```dart
import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

void main() {
  runApp(const STMaterialApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MyExampleApp();
  }
}
```

### Step 2: Toggle the Theme
Use `ThemeManager` to toggle between light and dark themes:

```dart
import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

class MyExampleApp extends StatelessWidget {
  const MyExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Theme Switcher Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final currentTheme = ThemeManager().currentThemeMode;
            ThemeManager().toggleTheme(
              currentTheme == AppThemeMode.dark ? AppThemeMode.light : AppThemeMode.dark,
            );
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
```

---

## API
### **STMaterialApp**
A widget that manages theme switching.
```dart
const STMaterialApp({required Widget child});
```

### **ThemeManager**
Singleton class for managing themes.
- `currentThemeMode` — Returns the current `AppThemeMode` (light or dark).
- `toggleTheme(AppThemeMode themeMode)` — Switches the theme to the specified mode.

---

## Example
A full working example is available in the `example/` directory.

---

## License
This project is licensed under the MIT License.

