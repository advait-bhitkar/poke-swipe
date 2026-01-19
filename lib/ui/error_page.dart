import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {

  const ErrorPage({
    super.key,
    this.title = 'Something Went Wrong',
    this.message = 'An unexpected error occurred. Please try again later.',
    this.icon = Icons.error_outline,
    this.actionLabel = 'Go Home',
    this.onAction,
  });

  final String title;
  final String message;
  final IconData icon;
  final String actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 80, color: Colors.redAccent),
            const SizedBox(height: 24),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (onAction != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.home),
                label: Text(actionLabel),
                onPressed: onAction,
              ),
          ],
        ),
      ),
    ),
  );
}

