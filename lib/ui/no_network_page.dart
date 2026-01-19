import 'package:flutter/material.dart';

class NoNetworkPage extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final String retryLabel;
  final VoidCallback? onRetry;

  const NoNetworkPage({
    Key? key,
    this.title = 'No Internet Connection',
    this.message = 'Please check your network settings and try again.',
    this.icon = Icons.wifi_off,
    this.retryLabel = 'Retry',
    this.onRetry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 80, color: Colors.grey),
              const SizedBox(height: 24),
              Text(title, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              if (onRetry != null)
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: Text(retryLabel),
                  onPressed: onRetry,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
