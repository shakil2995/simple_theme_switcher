import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_manager.dart';

class STMaterialApp extends StatelessWidget {
  final Widget child;
  final Color seedColor;
  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final Map<String, Widget Function(BuildContext)> routes;
  final String? initialRoute;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final List<NavigatorObserver> navigatorObservers;
  final String title;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner;

  const STMaterialApp({
    super.key,
    required this.child,
    this.seedColor = Colors.blue,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.title = '',
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowCheckedModeBanner = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: ThemeManager().cubit,
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          if (child is MaterialApp) {
            return child; // Use provided MaterialApp if already given
          } else {
            return MaterialApp(
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: scaffoldMessengerKey,
              routes: routes,
              initialRoute: initialRoute,
              onGenerateRoute: onGenerateRoute,
              navigatorObservers: navigatorObservers,
              title: title,
              locale: locale,
              localizationsDelegates: localizationsDelegates,
              supportedLocales: supportedLocales,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              theme: theme,
              home: child, // Wrap non-MaterialApp children
            );
          }
        },
      ),
    );
  }
}
