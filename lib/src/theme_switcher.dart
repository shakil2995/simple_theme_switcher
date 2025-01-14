import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_manager.dart';

/// A custom MaterialApp widget that integrates theme management using Bloc.
///
/// This widget provides additional customization options for managing themes,
/// localization, routes, and other application-level configurations.
class STMaterialApp extends StatelessWidget {
  /// The widget to display as the home screen of the application.
  final Widget? child;

  /// The color used as the seed for Material 3 dynamic color generation.
  final Color seedColor;

  /// A key for managing the state of the Navigator.
  final GlobalKey<NavigatorState>? navigatorKey;

  /// A key for managing the state of the ScaffoldMessenger.
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// A map defining the available named routes in the application.
  final Map<String, Widget Function(BuildContext)> routes;

  /// The name of the initial route to display when the app starts.
  final String? initialRoute;

  /// A function to generate routes when a named route is requested.
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  /// A list of observers for the Navigator.
  final List<NavigatorObserver> navigatorObservers;

  /// The title of the application.
  final String title;

  /// A function to generate the application title dynamically.
  final GenerateAppTitle? onGenerateTitle;

  /// The primary theme for the application.
  final ThemeData? theme;

  /// The theme used when the device is in dark mode.
  final ThemeData? darkTheme;

  /// The high contrast theme used in light mode.
  final ThemeData? highContrastTheme;

  /// The high contrast theme used in dark mode.
  final ThemeData? highContrastDarkTheme;

  /// The locale for the application.
  final Locale? locale;

  /// The delegates that provide localized resources.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// The locales supported by the application.
  final Iterable<Locale> supportedLocales;

  /// Whether to show the debug banner in debug mode.
  final bool debugShowCheckedModeBanner;

  /// Whether to show a performance overlay.
  final bool showPerformanceOverlay;

  /// Whether to checkerboard raster cache images.
  final bool checkerboardRasterCacheImages;

  /// Whether to checkerboard offscreen layers.
  final bool checkerboardOffscreenLayers;

  /// Whether to show a visual debugger for semantics.
  final bool showSemanticsDebugger;

  /// The default scroll behavior for the application.
  final ScrollBehavior scrollBehavior;

  /// The primary color for the application.
  final Color? color;

  /// Whether keyboard shortcuts are enabled.
  final bool shortcutsEnabled;

  /// Creates an instance of [STMaterialApp] with the given properties.
  const STMaterialApp({
    super.key,
    this.child,
    this.seedColor = Colors.blue,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.title = '',
    this.onGenerateTitle,
    this.theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowCheckedModeBanner = true,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.scrollBehavior = const MaterialScrollBehavior(),
    this.color,
    this.shortcutsEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>.value(
      value: ThemeManager().cubit,
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            scrollBehavior: scrollBehavior,
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: scaffoldMessengerKey,
            routes: routes,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            navigatorObservers: navigatorObservers,
            title: title,
            onGenerateTitle: onGenerateTitle,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            theme: theme,
            darkTheme: darkTheme,
            highContrastTheme: highContrastTheme,
            highContrastDarkTheme: highContrastDarkTheme,
            color: color,
            home: child,
          );
        },
      ),
    );
  }
}
