import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      child: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theme Switcher Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ThemeManager().toggleTheme(
              ThemeManager().currentThemeMode == AppThemeMode.light
                  ? AppThemeMode.dark
                  : AppThemeMode.light,
            );
          },
          child: Text('Toggle Theme'),
        ),
      ),
    );
  }
}
