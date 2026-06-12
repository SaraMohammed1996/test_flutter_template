import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/presentation/providers/base_state.dart';

/// Base notifier for non-paginated features
///
/// Usage:
/// ```dart
/// class DashboardNotifier extends BaseNotifier<Dashboard> {
///   final GetDashboardUseCase _useCase;
///
///   DashboardNotifier(this._useCase) : super();
///
///   @override
///   Future<Result<Dashboard>> fetchData({
///     Map<String, dynamic>? params,
///   }) async {
///     return await _useCase.execute(...);
///   }
/// }
/// ```
abstract class BaseNotifier<T> extends StateNotifier<BaseState<T>> {
  BaseNotifier() : super(const BaseState.initial());

  /// Load data (refresh)
  Future<void> load({Map<String, dynamic>? params}) async {
    state = const BaseState.loading();

    final result = await fetchData(params: params);

    switch (result) {
      case Success<T>(:final data):
        state = BaseState.loaded(data);
      case Failure<T>(:final message):
        state = BaseState.error(message);
    }
  }

  /// Refresh current data (reloads same data)
  Future<void> refresh({Map<String, dynamic>? params}) async {
    final currentState = state;
    T? currentData;

    currentState.whenOrNull(loaded: (data) => currentData = data);

    final dataToUse = currentData;
    if (dataToUse == null) {
      // If not loaded, just load
      return load(params: params);
    }

    final result = await fetchData(params: params);

    switch (result) {
      case Success<T>(:final data):
        state = BaseState.loaded(data);
      case Failure<T>():
        // Keep current data on error
        state = BaseState.loaded(dataToUse);
    }
  }

  /// Abstract method to fetch data - implement in subclass
  ///
  /// This method is called internally by [load] and [refresh].
  /// Do not call directly from outside the class.
  @protected
  Future<Result<T>> fetchData({Map<String, dynamic>? params});
}
