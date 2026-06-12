/// Result pattern for error handling in use cases
///
/// This follows the Either/Result pattern recommended in the project rules
/// for handling errors in the domain layer.
library;

/// Represents a result that can be either a success with data or a failure
sealed class Result<T> {
  const Result();
}

/// Success result containing data
final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

/// Failure result containing error information
final class Failure<T> extends Result<T> {
  final String message;
  final String? code;
  final Map<String, dynamic>? data;

  const Failure({required this.message, this.code, this.data});

  @override
  String toString() => 'Failure: $message';
}

/// Extension methods for Result
extension ResultExtensions<T> on Result<T> {
  /// Fold the result into a single value
  R fold<R>({
    required R Function(Failure<T> failure) onFailure,
    required R Function(Success<T> success) onSuccess,
  }) {
    return switch (this) {
      Failure<T>(:final message, :final code, :final data) => onFailure(
        Failure(message: message, code: code, data: data),
      ),
      Success<T>(:final data) => onSuccess(Success(data)),
    };
  }

  /// Map the success value to another type
  Result<R> map<R>(R Function(T data) mapper) {
    return switch (this) {
      Failure<T>(:final message, :final code, :final data) => Failure<R>(
        message: message,
        code: code,
        data: data,
      ),
      Success<T>(:final data) => Success(mapper(data)),
    };
  }

  /// Get the data if success, otherwise null
  T? get dataOrNull => switch (this) {
    Success<T>(:final data) => data,
    Failure<T>() => null,
  };

  /// Get the failure message if failure, otherwise null
  String? get failureMessage => switch (this) {
    Failure<T>(:final message) => message,
    Success<T>() => null,
  };

  /// Check if result is success
  bool get isSuccess => this is Success<T>;

  /// Check if result is failure
  bool get isFailure => this is Failure<T>;
}
