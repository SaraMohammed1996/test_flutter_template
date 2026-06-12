import 'package:flutter/material.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/utils/network_error_helper.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

/// Reusable error state widget
///
/// Usage:
/// ```dart
/// ErrorStateWidget(
///   message: 'Error message',
///   onRetry: () => ref.read(provider.notifier).loadData(),
/// )
/// ```
class ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;
  final IconData? icon;
  final String? retryText;

  const ErrorStateWidget({
    super.key,
    required this.message,
    this.onRetry,
    this.icon,
    this.retryText,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    // Get user-friendly, localized message (API fallbacks, provider messages, network/server)
    final displayMessage = NetworkErrorHelper.getDisplayError(message, l10n);
    
    // Determine the appropriate icon
    IconData displayIcon;
    if (icon != null) {
      displayIcon = icon!;
    } else if (NetworkErrorHelper.isNetworkError(message)) {
      displayIcon = Icons.wifi_off;
    } else if (NetworkErrorHelper.isServerError(message)) {
      displayIcon = Icons.cloud_off;
    } else {
      displayIcon = Icons.error_outline;
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(displayIcon, size: 64, color: AppTheme.error),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              displayMessage,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: context.themeTextSecondary,
                  ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppTheme.spacingMd),
              ElevatedButton(
                onPressed: onRetry,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: AppTheme.whiteColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingLg,
                    vertical: AppTheme.spacingMd,
                  ),
                ),
                child: Text(retryText ?? l10n.retry),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
