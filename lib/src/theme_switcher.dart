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
  final GenerateAppTitle? onGenerateTitle;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final ThemeData? highContrastTheme;
  final ThemeData? highContrastDarkTheme;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool useInheritedMediaQuery;
  final ScrollBehavior scrollBehavior;
  final Color? color;
  final bool shortcutsEnabled;

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
    this.useInheritedMediaQuery = false,
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
            useInheritedMediaQuery: useInheritedMediaQuery,
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
