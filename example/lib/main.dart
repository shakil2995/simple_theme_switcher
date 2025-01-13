import 'package:flutter/material.dart';
import 'package:simple_theme_switcher/simple_theme_switcher.dart';

void main() {
  runApp(
      const STMaterialApp(debugShowCheckedModeBanner: false, child: MyApp()));
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
    // Wrap Your app with STMaterialApp instead of MaterialApp
    // Providing both STMaterialApp and MaterialApp will conflict each other and cause an error
    // Instead, just wrap your app with STMaterialApp and pass any required parameters
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
            // Use ThemeManager to toggle theme
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
