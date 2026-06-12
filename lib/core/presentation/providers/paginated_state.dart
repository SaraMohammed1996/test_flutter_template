import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flutter_template/core/domain/paginated_list.dart';

part 'paginated_state.freezed.dart';

/// Reusable state for paginated features
@freezed
class PaginatedState<T> with _$PaginatedState<T> {
  const factory PaginatedState.initial() = _Initial<T>;
  const factory PaginatedState.loading() = _Loading<T>;
  const factory PaginatedState.loaded(PaginatedList<T> data) = _Loaded<T>;
  const factory PaginatedState.loadingMore(PaginatedList<T> data) =
      _LoadingMore<T>;
  const factory PaginatedState.error(String message) = _Error<T>;
}
