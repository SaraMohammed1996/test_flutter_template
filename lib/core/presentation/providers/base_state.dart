import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

/// Base state for non-paginated features
@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.initial() = _Initial<T>;
  const factory BaseState.loading() = _Loading<T>;
  const factory BaseState.loaded(T data) = _Loaded<T>;
  const factory BaseState.error(String message) = _Error<T>;
}
