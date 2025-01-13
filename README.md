# Simple Theme Switcher

A lightweight Flutter package for easily switching between light and dark themes with minimal setup. This package simplifies theme management, allowing developers to toggle themes efficiently.

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
  simple_theme_switcher: ^latest
```

Run the following command:
```bash
flutter pub get
```

---

## Usage

### Step 1: Wrap Your App with `STMaterialApp`
In your `main.dart` file, replace `MaterialApp` with `STMaterialApp`:

```dart
import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

void main() {
  runApp(const STMaterialApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          'Theme Switcher Example',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final themeManager = ThemeManager();
            themeManager.toggleTheme(
              themeManager.currentThemeMode == AppThemeMode.light
                  ? AppThemeMode.dark
                  : AppThemeMode.light,
              seedColor: Colors.yellow, // Optional seed color
            );
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
```

### Important Notes
- **Do not** use both `MaterialApp` and `STMaterialApp` simultaneously. This will cause conflicts.
- Simply replace `MaterialApp` with `STMaterialApp` and pass any required parameters.

---

## API
### **STMaterialApp**
A widget that manages theme switching.
```dart
const STMaterialApp({required Widget child});
```

### **ThemeManager**
Singleton class for managing themes.
- `currentThemeMode` &mdash; Returns the current `AppThemeMode` (light or dark).
- `toggleTheme(AppThemeMode themeMode, {Color? seedColor})` &mdash; Switches the theme to the specified mode. An optional `seedColor` parameter can be provided.

---

## Example
A full working example is available in the `example/` directory.

---

## License
This project is licensed under the MIT License.

