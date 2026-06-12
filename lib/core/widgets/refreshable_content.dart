import 'package:flutter/material.dart';
import 'package:test_flutter_template/core/presentation/providers/base_state.dart';
import 'package:test_flutter_template/core/widgets/error_state_widget.dart';
import 'package:test_flutter_template/core/widgets/loading_state_widget.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

/// Reusable widget for pull-to-refresh with state handling
///
/// Works with BaseState<T> from BaseNotifier
///
/// Usage:
/// ```dart
/// RefreshableContent<Dashboard>(
///   state: ref.watch(dashboardProvider),
///   onRefresh: () => ref.read(dashboardProvider.notifier).load(),
///   onRetry: () => ref.read(dashboardProvider.notifier).load(),
///   childBuilder: (data) => _buildDashboardContent(data),
/// )
/// ```
class RefreshableContent<T> extends StatelessWidget {
  final BaseState<T> state;
  final Future<void> Function() onRefresh;
  final Widget Function(T data) childBuilder;
  final VoidCallback? onRetry;
  final Widget? emptyWidget;
  final bool Function(T data)? isEmpty;

  const RefreshableContent({
    super.key,
    required this.state,
    required this.onRefresh,
    required this.childBuilder,
    this.onRetry,
    this.emptyWidget,
    this.isEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: state.maybeWhen(
        loaded: (data) {
          // Check if data is empty
          if (isEmpty != null && isEmpty!(data)) {
            return emptyWidget ??
                ErrorStateWidget(
                  message: AppLocalizations.of(context)!.noData,
                  onRetry: onRetry ?? () => onRefresh(),
                );
          }
          return childBuilder(data);
        },
        error: (message) => ErrorStateWidget(
          message: message,
          onRetry: onRetry ?? () => onRefresh(),
        ),
        orElse: () => const LoadingStateWidget(),
      ),
    );
  }
}
