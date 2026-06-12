import 'dart:async';
import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:logging/logging.dart';
import 'package:test_flutter_template/core/api/errors/api_errors.dart';
import 'package:test_flutter_template/core/api/serializers.dart';
import 'package:test_flutter_template/features/auth/data/models/auth_api_response_dto.dart';

class BuiltValueConverter extends JsonConverter implements ErrorConverter {
  final Logger _logger = Logger('BuiltValueConverter');

  @override
  Request convertRequest(Request request) {
    // Handle non-multipart requests with built_value objects
    if (!request.multipart && request.body is! Map) {
      final data = serializers.serialize(request.body);

      // Remove type discriminator if present
      if (data is Map) {
        data.remove(r'$');
      }

      // Convert to JSON request
      return super.convertRequest(request.copyWith(body: data));
    }
    // Handle multipart requests with Map body
    else if (request.multipart && request.body is Map) {
      final parts = List<PartValue>.from(request.parts);
      (request.body as Map).forEach((key, value) {
        parts.add(PartValue(key, value.toString()));
      });
      return request.copyWith(parts: parts);
    }
    // Handle Map bodies (already serialized)
    else if (request.body is Map) {
      return super.convertRequest(request);
    }
    // Default case
    else {
      return super.convertRequest(request);
    }
  }

  @override
  Future<Response<BodyType>> convertResponse<BodyType, SingleItemType>(
    Response response,
  ) async {
    try {
      // The response parameter contains raw binary JSON data by default.
      // Utilize the already written code which converts this data to a dynamic Map or a List of Maps.
      final Response dynamicResponse = await super.convertResponse(response);

      // customBody can be either a BuiltList<SingleItemType> or just the SingleItemType (if there's no list).
      final BodyType? customBody = _convertToCustomObject<SingleItemType>(
        dynamicResponse.body,
      );

      // Return the original dynamicResponse with a no-longer-dynamic body type.
      return dynamicResponse.copyWith<BodyType>(body: customBody);
    } catch (e) {
      _logger.severe(e);
      rethrow;
    }
  }

  @override
  FutureOr<Response> convertError<BodyType, InnerType>(
    Response response,
  ) async {
    try {
      final convertedResponse = await super.convertError(response);

      _logger.info(response.base.request?.headers.toString());
      
      // Check if response is 404 (e.g. invalid domain or API error)
      final bodyString = convertedResponse.bodyString;
      final body = json.decode(bodyString);

      if (response.statusCode == 404) {
        if (body is Map && body.containsKey('error')) {
          throw ResponseError(
            message: body['error'],
            code: '404',
          );
        }
        throw ResponseError(
          message: 'INVALID_DOMAIN_ERROR',
          code: '404',
        );
      }

      // Handle validation errors (422)
      if (response.statusCode == 422 &&
          body is Map &&
          body.containsKey('errors')) {
        _logger.severe(body['errors']);
        final errors = body['errors'] as Map;
        String? firstError;
        if (errors.values.isNotEmpty) {
          final firstValue = errors.values.first;
          // Handle both list and string error formats
          if (firstValue is List && firstValue.isNotEmpty) {
            firstError = firstValue.first.toString();
          } else if (firstValue is String) {
            firstError = firstValue;
          } else {
            firstError = firstValue.toString();
          }
        }
        throw ResponseValidationError(
          message: firstError ?? body['message'] ?? 'Validation failed',
          data: body['errors'],
        );
      }

      // Handle other errors
      if (body is Map) {
        final message = body['message'] ?? body['error'] ?? 'An error occurred';
        throw ResponseError(message: message);
      }

      throw ResponseError(message: 'An error occurred');
    } catch (e) {
      _logger.severe(e);
      rethrow;
    }
  }

  /// Extract data field, preserving meta and other root-level fields (e.g. unreaded_count) if present
  /// If meta exists, returns {'data': ..., 'meta': ..., 'unreaded_count': ... (if present)}
  /// Otherwise, returns the data value directly (Map or List)
  dynamic _extractDataWithMeta(Map element) {
    final dataValue = element['data'];
    // If meta exists, keep the full object with data, meta, and any extra root-level fields
    if (element.containsKey('meta')) {
      final result = <String, dynamic>{
        'data': dataValue,
        'meta': element['meta'],
      };
      if (element.containsKey('unreaded_count')) {
        result['unreaded_count'] = element['unreaded_count'];
      }
      return result;
    }
    // Extract the data value directly (Map or List)
    // Lists will be handled in the deserialization step below
    return dataValue;
  }

  dynamic _convertToCustomObject<SingleItemType>(dynamic element) {
    _logger.info(element);

    if (element is Map) {
      // Case 1: Error-only response format: {"error": "message"}
      if (element.containsKey('error')) {
        throw ResponseError(message: element['error'] ?? 'An error occurred');
      }

      // Case 2: Response with success field
      if (element.containsKey('success')) {
        final success = element['success'];
        // Only check success if it's not null
        if (success != null && success != true) {
          // Handle validation errors
          if (element.containsKey('errors')) {
            throw ResponseValidationError(
              message: element['message'] ?? 'Validation failed',
              data: element['errors'],
            );
          }

          // Handle general errors
          throw ResponseError(
            message: element['message'] ?? 'An error occurred',
            code: element['code']?.toString(),
          );
        }

        // Extract data from wrapper if success is true or null
        // (null success means we should still try to extract data)
        if (element.containsKey('data') &&
            !_shouldPreserveApiWrapper<SingleItemType>()) {
          element = _extractDataWithMeta(element);
        }
      }
      // Case 3: Direct data response (no success field)
      else if (element.containsKey('data')) {
        element = _extractDataWithMeta(element);
      }

      // Case 4: Direct object (no wrapper at all)
      // Continue processing below
    }

    // If the type which the response should hold is explicitly set to a dynamic Mapmap,
    // there's nothing we can convert.
    if (element is SingleItemType || element == null) return element;

    if (element is List) {
      return _deserializeListOf<SingleItemType>(element);
    } else if (element is Map<String, dynamic>) {
      return _deserialize<SingleItemType>(element);
    } else {
      // If element is not a Map, try to deserialize it anyway (might be a different Map type)
      return _deserialize<SingleItemType>(
        element is Map ? Map<String, dynamic>.from(element) : null,
      );
    }
  }

  BuiltList<SingleItemType> _deserializeListOf<SingleItemType>(
    List dynamicList,
  ) {
    // Make a BuiltList holding individual custom objects
    return BuiltList<SingleItemType>(
      dynamicList.map((bodyData) => _deserialize<SingleItemType>(bodyData)),
    );
  }

  SingleItemType? _deserialize<SingleItemType>(Map<String, dynamic>? value) {
    // We have a type parameter for the BuiltValue type
    // which should be returned after deserialization.
    return serializers.deserializeWith<SingleItemType?>(
      serializers.serializerForType(SingleItemType)
          as Serializer<SingleItemType?>,
      value,
    );
  }

  bool _shouldPreserveApiWrapper<SingleItemType>() {
    return SingleItemType == AuthApiResponseDto;
  }
}
