class ResponseError implements Exception {
  String? message;
  String? code;
  @override
  String toString() => '$message';

  ResponseError({this.message = 'Response returned with an error!', this.code});
}

class ResponseValidationError implements Exception {
  String message;
  String? code;
  Map<String, dynamic>? data;
  @override
  String toString() => 'Validation Error: $message';

  ResponseValidationError({
    this.message = 'Response returned with a validation error!',
    this.code,
    this.data,
  });
}
