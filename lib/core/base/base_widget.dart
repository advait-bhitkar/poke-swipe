import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Opinionated base class for stateless widgets.
/// Provides a consistent build context, navigation helpers, and analytics hooks.
abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  /// Override this instead of build for a cleaner API.
  Widget buildContent(BuildContext context);

  /// Optionally override to track page views for analytics.
  @protected
  void onPageView(BuildContext context) {}

  /// Navigation helpers
  void go(BuildContext context, String location) => context.go(location);
  void push(BuildContext context, String location) => context.push(location);
  void pop(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    onPageView(context); // Analytics hook
    return buildContent(context);
  }
}

/// Opinionated base class for stateful widgets.
/// Provides a consistent state object, navigation helpers, and analytics hooks.
abstract class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({super.key});
}

abstract class BaseState<T extends BaseStatefulWidget> extends State<T> {
  /// Override this instead of build for a cleaner API.
  Widget buildContent(BuildContext context);

  /// Optionally override to track page views for analytics.
  @protected
  void onPageView(BuildContext context) {}

  /// Navigation helpers
  void go(String location) => context.go(location);
  void push(String location) => context.push(location);
  void pop() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    onPageView(context); // Analytics hook
    return buildContent(context);
  }
}

/// Usage:
/// - Extend BaseStatelessWidget or BaseStatefulWidget/BaseState for your widgets.
/// - Use go(), push(), pop() for navigation.
/// - Override onPageView for analytics tracking.
