import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

void main() {
  runApp(const ThemeSwitcher(child: MyExampleApp()));
}

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
              currentTheme == AppThemeMode.dark
                  ? AppThemeMode.light
                  : AppThemeMode.dark,
            );
          },
          child: const Text('Toggle Theme'),
        ),
      ),
    );
  }
}
