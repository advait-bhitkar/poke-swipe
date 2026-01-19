import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../my_app.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Appearance', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (context, mode, _) => SwitchListTile(
                title: const Text('Dark Mode'),
                value: mode == ThemeMode.dark,
                onChanged: (isDark) => themeModeNotifier.value = isDark ? ThemeMode.dark : ThemeMode.light,
                secondary: Icon(mode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: dynamicColorEnabledNotifier,
              builder: (context, enabled, _) => SwitchListTile(
                title: const Text('Dynamic Color'),
                value: enabled,
                onChanged: (value) => dynamicColorEnabledNotifier.value = value,
                secondary: const Icon(Icons.palette),
              ),
            ),
            const Divider(height: 32),
            Text('Font Scaling', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            ValueListenableBuilder<bool>(
              valueListenable: fontScalingEnabledNotifier,
              builder: (context, enabled, _) => SwitchListTile(
                title: const Text('Enable Font Scaling'),
                value: enabled,
                onChanged: (value) => fontScalingEnabledNotifier.value = value,
                secondary: const Icon(Icons.text_fields),
              ),
            ),
            ValueListenableBuilder2<bool, double>(
              first: fontScalingEnabledNotifier,
              second: fontScaleNotifier,
              builder: (context, scalingEnabled, fontScale, _) => ListTile(
                title: const Text('Font Size'),
                subtitle: Slider(
                  value: fontScale,
                  min: 0.8,
                  max: 1.5,
                  divisions: 7,
                  label: fontScale.toStringAsFixed(2),
                  onChanged: scalingEnabled ? (value) => fontScaleNotifier.value = value : null,
                ),
                leading: const Icon(Icons.format_size),
                enabled: scalingEnabled,
              ),
            ),
            const Divider(height: 32),
          ],
        ),
      ),
    );
}

// Helper for two ValueListenables
class ValueListenableBuilder2<A, B> extends StatelessWidget {
  const ValueListenableBuilder2({required this.first, required this.second, required this.builder, this.child, super.key});
  final ValueListenable<A> first;
  final ValueListenable<B> second;
  final Widget Function(BuildContext, A, B, Widget?) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<A>(
      valueListenable: first,
      builder: (context, a, _) => ValueListenableBuilder<B>(
        valueListenable: second,
        builder: (context, b, __) => builder(context, a, b, child),
        child: child,
      ),
      child: child,
    );
}
