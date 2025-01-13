import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      child: Scaffold(
        appBar: AppBar(title: const Text('Theme Switcher Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              ThemeManager().toggleTheme(
                ThemeManager().currentThemeMode == AppThemeMode.light
                    ? AppThemeMode.dark
                    : AppThemeMode.light,
                seedColor: Colors.teal, // Optional Seed color
              );
            },
            child: const Text('Toggle Theme'),
          ),
        ),
      ),
    );
  }
}
