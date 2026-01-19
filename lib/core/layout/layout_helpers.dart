import 'package:flutter/material.dart';

/// Responsive breakpoints
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < tablet;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= tablet && MediaQuery.of(context).size.width < desktop;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= desktop;
}

/// Safe area helper widget
class SafeAreaPadding extends StatelessWidget {

  const SafeAreaPadding({
    super.key,
    required this.child,
    this.top = true,
    this.bottom = true,
    this.left = true,
    this.right = true,
  });

  final Widget child;
  final bool top;
  final bool bottom;
  final bool left;
  final bool right;

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsets.only(
        top: top ? padding.top : 0,
        bottom: bottom ? padding.bottom : 0,
        left: left ? padding.left : 0,
        right: right ? padding.right : 0,
      ),
      child: child,
    );
  }
}

/// Adaptive navigation: switches between BottomNavigationBar and NavigationRail
class AdaptiveNavigation extends StatelessWidget {

  const AdaptiveNavigation({
    super.key,
    required this.selectedIndex,
    required this.destinations,
    required this.onDestinationSelected,
    required this.child,
  });
  final int selectedIndex;
  final List<NavigationDestination> destinations;
  final ValueChanged<int> onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Breakpoints.isDesktop(context) || Breakpoints.isTablet(context)) {
      return Row(
        children: [
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: destinations
                .map((d) => NavigationRailDestination(
                      icon: d.icon,
                      label: Text(d.label),
                    ))
                .toList(),
            labelType: NavigationRailLabelType.selected,
          ),
          Expanded(child: child),
        ],
      );
    } else {
      return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: destinations,
        ),
      );
    }
  }
}

