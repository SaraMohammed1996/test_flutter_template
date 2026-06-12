import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/domain/paginated_list.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/presentation/providers/paginated_state.dart';

/// Base notifier for paginated features
///
/// Usage:
/// ```dart
/// class NotificationNotifier extends PaginatedNotifier<Notification> {
///   final GetNotificationsUseCase _useCase;
///
///   NotificationNotifier(this._useCase) : super();
///
///   @override
///   Future<Result<PaginatedList<Notification>>> fetchPage({
///     required int page,
///     Map<String, dynamic>? params,
///   }) async {
///     return await _useCase.execute(page: page, ...);
///   }
/// }
/// ```
abstract class PaginatedNotifier<T> extends StateNotifier<PaginatedState<T>> {
  PaginatedNotifier() : super(const PaginatedState.initial());

  /// Load data (refresh) - always loads page 1
  Future<void> load({Map<String, dynamic>? params}) async {
    state = const PaginatedState.loading();

    final result = await fetchPage(page: 1, params: params);

    switch (result) {
      case Success<PaginatedList<T>>(:final data):
        state = PaginatedState.loaded(data);
      case Failure<PaginatedList<T>>(:final message):
        state = PaginatedState.error(message);
    }
  }

  /// Load more (infinite scroll) - loads next page
  Future<void> loadMore({Map<String, dynamic>? params}) async {
    final currentState = state;
    PaginatedList<T>? currentData;

    // Extract data from current state
    currentState.whenOrNull(
      loaded: (data) => currentData = data,
      loadingMore: (data) => currentData = data,
    );

    final dataToUse = currentData;
    if (dataToUse == null || !dataToUse.hasMore) return;
    // Show loading more state while keeping data visible
    state = PaginatedState.loadingMore(dataToUse);

    final result = await fetchPage(
      page: dataToUse.currentPage + 1,
      params: params,
    );

    switch (result) {
      case Success<PaginatedList<T>>(:final data):
        // Append new items to existing list
        final updatedData = dataToUse.appendPage(data);
        state = PaginatedState.loaded(updatedData);
      case Failure<PaginatedList<T>>():
        // Revert to loaded state on error, don't clear data
        state = PaginatedState.loaded(dataToUse);
    }
  }

  /// Refresh current page (reloads same page)
  Future<void> refresh({Map<String, dynamic>? params}) async {
    final currentState = state;
    PaginatedList<T>? currentData;

    currentState.whenOrNull(
      loaded: (data) => currentData = data,
      loadingMore: (data) => currentData = data,
    );

    final dataToUse = currentData;
    if (dataToUse == null) {
      // If not loaded, just load page 1
      return load(params: params);
    }
    final result = await fetchPage(page: dataToUse.currentPage, params: params);

    switch (result) {
      case Success<PaginatedList<T>>(:final data):
        state = PaginatedState.loaded(data);
      case Failure<PaginatedList<T>>():
        // Keep current data on error
        state = PaginatedState.loaded(dataToUse);
    }
  }

  /// Abstract method to fetch a page - implement in subclass
  ///
  /// This method is called internally by [load], [loadMore], and [refresh].
  /// Do not call directly from outside the class.
  @protected
  Future<Result<PaginatedList<T>>> fetchPage({
    required int page,
    Map<String, dynamic>? params,
  });
}
