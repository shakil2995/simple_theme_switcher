import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AppThemeMode { light, dark }

class ThemeManager {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;

  final ThemeCubit _themeCubit = ThemeCubit();

  ThemeManager._internal();

  ThemeCubit get cubit => _themeCubit;

  void toggleTheme(AppThemeMode themeMode, {Color? seedColor}) {
    _themeCubit.toggleTheme(themeMode, seedColor: seedColor);
  }

  AppThemeMode get currentThemeMode =>
      _themeCubit.state.brightness == Brightness.light
          ? AppThemeMode.light
          : AppThemeMode.dark;
}

class ThemeCubit extends Cubit<ThemeData> {
  static const Color defaultSeedColor = Colors.blue;

  static ThemeData lightTheme(Color seedColor) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor, brightness: Brightness.light),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme(Color seedColor) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor, brightness: Brightness.dark),
      useMaterial3: true,
    );
  }

  ThemeCubit() : super(lightTheme(defaultSeedColor));

  void toggleTheme(AppThemeMode themeMode, {Color? seedColor}) {
    final color = seedColor ?? defaultSeedColor;
    emit(
        themeMode == AppThemeMode.light ? lightTheme(color) : darkTheme(color));
  }
}
