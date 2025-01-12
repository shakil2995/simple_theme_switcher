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
}

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final ThemeData _lightTheme = ThemeData.light();
  static final ThemeData _darkTheme = ThemeData.dark();

  void toggleTheme(AppThemeMode themeMode) {
    emit(themeMode == AppThemeMode.light ? _lightTheme : _darkTheme);
  }
}
