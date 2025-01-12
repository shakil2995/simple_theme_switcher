import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { light, dark }

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._();
  factory ThemeManager() => _instance;

  ThemeCubit _themeCubit = ThemeCubit();

  ThemeManager._();

  ThemeCubit get cubit => _themeCubit;

  void toggleTheme(AppThemeMode themeMode) {
    _themeCubit.toggleTheme(themeMode);
  }

  // Method to get current theme mode
  AppThemeMode get currentThemeMode =>
      _themeCubit.state == ThemeCubit.lightTheme
          ? AppThemeMode.light
          : AppThemeMode.dark;
}

class ThemeCubit extends Cubit<ThemeData> {
  static final ThemeData lightTheme = ThemeData.light();
  static final ThemeData darkTheme = ThemeData.dark();

  ThemeCubit() : super(lightTheme);

  void toggleTheme(AppThemeMode themeMode) {
    emit(themeMode == AppThemeMode.light ? lightTheme : darkTheme);
  }
}
