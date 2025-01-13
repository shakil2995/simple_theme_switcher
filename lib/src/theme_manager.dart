import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Enum to define the two possible theme modes: light and dark
enum AppThemeMode { light, dark }

/// Singleton class to manage the application's theme.
/// This class provides access to a `ThemeCubit` to toggle themes.
class ThemeManager {
  // Private instance for singleton pattern
  static final ThemeManager _instance = ThemeManager._internal();

  // Factory constructor to return the same instance
  factory ThemeManager() => _instance;

  // Instance of the ThemeCubit which handles the theme state
  final ThemeCubit _themeCubit = ThemeCubit();

  // Private internal constructor
  ThemeManager._internal();

  // Getter to access the ThemeCubit
  ThemeCubit get cubit => _themeCubit;

  // Method to toggle the theme and optionally change the seed color
  void toggleTheme(AppThemeMode themeMode, {Color? seedColor}) {
    _themeCubit.toggleTheme(themeMode, seedColor: seedColor);
  }

  // Getter to retrieve the current theme mode (light or dark)
  AppThemeMode get currentThemeMode =>
      _themeCubit.state.brightness == Brightness.light
          ? AppThemeMode.light
          : AppThemeMode.dark;
}

/// Cubit that manages the theme state of the application.
/// It emits a `ThemeData` object based on the current theme mode.
class ThemeCubit extends Cubit<ThemeData> {
  // Default color used for the theme's seed color
  static const Color defaultSeedColor = Colors.blue;

  // Static method to generate light theme using a seed color
  static ThemeData lightTheme(Color seedColor) {
    return ThemeData(
      // Generate color scheme from the seed color for light theme
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor, brightness: Brightness.light),
      useMaterial3: true, // Enables Material 3 design
    );
  }

  // Static method to generate dark theme using a seed color
  static ThemeData darkTheme(Color seedColor) {
    return ThemeData(
      // Generate color scheme from the seed color for dark theme
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor, brightness: Brightness.dark),
      useMaterial3: true, // Enables Material 3 design
    );
  }

  // Constructor to initialize the cubit with the default light theme
  ThemeCubit() : super(lightTheme(defaultSeedColor));

  // Method to toggle between light and dark themes
  void toggleTheme(AppThemeMode themeMode, {Color? seedColor}) {
    final color =
        seedColor ?? defaultSeedColor; // Use provided color or default
    // Emit the appropriate theme (light or dark) based on the theme mode
    emit(
        themeMode == AppThemeMode.light ? lightTheme(color) : darkTheme(color));
  }
}
