import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_manager.dart';

class ThemeSwitcher extends StatelessWidget {
  final Widget child;
  final Color seedColor;

  const ThemeSwitcher({
    super.key,
    required this.child,
    this.seedColor = Colors.blue, // Default seed color
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: ThemeManager().cubit,
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            theme: theme,
            home: child,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
