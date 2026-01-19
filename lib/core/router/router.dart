import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../home_scaffold.dart';

/// Analytics observer for navigation events.
class AnalyticsNavigationObserver extends NavigatorObserver {
  AnalyticsNavigationObserver({required this.onPageView});
  final void Function(String routeName) onPageView;

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      onPageView(route.settings.name!);
    }
    super.didPush(route, previousRoute);
  }
}

GoRouter createRouter({
  required void Function(String routeName) onPageView,
  bool isLoggedIn = true, // Pass this from your app's state
}) => GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: kDebugMode,
    observers: [AnalyticsNavigationObserver(onPageView: onPageView)],
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScaffold(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const Placeholder(),
      ),
      // Add more routes here
    ],
    redirect: (context, state) {
      // Redirect unauthenticated users to /login, except when already there
      if (!isLoggedIn && state.matchedLocation != '/login') return '/login';
      // Redirect authenticated users away from /login
      if (isLoggedIn && state.matchedLocation == '/login') return '/';
      return null;
    },
  );

/// For web: call this early in main() to use path URLs instead of hash URLs.
/// In your main.dart, add:
///   import 'package:flutter_web_plugins/flutter_web_plugins.dart';
///   setUrlStrategy(PathUrlStrategy());
Future<void> setUrlStrategyForWeb() async {
  if (kIsWeb) {
    // You must import flutter_web_plugins and call setUrlStrategy(PathUrlStrategy()) in main.dart
  }
}
