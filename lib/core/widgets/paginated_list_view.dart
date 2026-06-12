import 'package:flutter/material.dart';
import 'package:test_flutter_template/core/domain/paginated_list.dart';
import 'package:test_flutter_template/core/presentation/providers/paginated_state.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/widgets/error_state_widget.dart';
import 'package:test_flutter_template/core/widgets/loading_state_widget.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

/// Reusable widget for paginated lists with pull-to-refresh and infinite scroll
///
/// Works with PaginatedState<T> from PaginatedNotifier
///
/// Usage:
/// ```dart
/// PaginatedListView<Notification>(
///   state: ref.watch(notificationProvider),
///   onRefresh: () => ref.read(notificationProvider.notifier).load(),
///   onLoadMore: () => ref.read(notificationProvider.notifier).loadMore(),
///   itemBuilder: (context, notification, index) => NotificationItem(notification),
///   emptyWidget: Center(child: Text('No notifications')),
/// )
/// ```
class PaginatedListView<T> extends StatefulWidget {
  final PaginatedState<T> state;
  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoadMore;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final Widget? emptyWidget;
  final ScrollController? scrollController;
  final EdgeInsets? padding;
  final double loadMoreThreshold; // Percentage of scroll to trigger load more

  const PaginatedListView({
    super.key,
    required this.state,
    required this.onRefresh,
    this.onLoadMore,
    required this.itemBuilder,
    this.emptyWidget,
    this.scrollController,
    this.padding,
    this.loadMoreThreshold = 0.9,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  late ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController ?? ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    } else {
      _scrollController.removeListener(_onScroll);
    }
    super.dispose();
  }

  void _onScroll() {
    if (_isLoadingMore) return;
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    if (position.pixels >=
        position.maxScrollExtent * widget.loadMoreThreshold) {
      final currentState = widget.state;
      PaginatedList<T>? data;

      currentState.whenOrNull(
        loaded: (d) => data = d,
        loadingMore: (d) => data = d,
      );

      if (data != null && data!.hasMore && widget.onLoadMore != null) {
        _isLoadingMore = true;
        widget.onLoadMore!().then((_) {
          if (mounted) {
            setState(() => _isLoadingMore = false);
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: widget.state.maybeWhen(
        loaded: (data) => _buildList(data),
        loadingMore: (data) => _buildList(data, showLoadingMore: true),
        error: (message) => ErrorStateWidget(
          message: message,
          onRetry: () => widget.onRefresh(),
        ),
        orElse: () => const LoadingStateWidget(),
      ),
    );
  }

  Widget _buildList(PaginatedList<T> data, {bool showLoadingMore = false}) {
    if (data.isEmpty) {
      return widget.emptyWidget ??
          ErrorStateWidget(
            message: AppLocalizations.of(context)!.noData,
            onRetry: () => widget.onRefresh(),
          );
    }

    return ListView.builder(
      controller: _scrollController,
      padding: widget.padding,
      itemCount: data.items.length + (data.hasMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= data.items.length) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppTheme.spacingMd),
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget.itemBuilder(context, data.items[index], index);
      },
    );
  }
}
