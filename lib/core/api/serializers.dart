import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:test_flutter_template/core/api/models/api_success_response_dto.dart';
import 'package:test_flutter_template/core/api/models/enum/boolean_flag.dart';
import 'package:test_flutter_template/core/api/models/pagination_meta_dto.dart';
import 'package:test_flutter_template/core/api/serializers/int_to_bool_plugin.dart';
import 'package:test_flutter_template/core/api/serializers/string_to_number_plugin.dart';
import 'package:test_flutter_template/features/auth/data/models/auth_api_response_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/auth_response_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/login_request_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/register_request_dto.dart';
import 'package:test_flutter_template/features/auth/data/models/user_dto.dart';
import 'package:test_flutter_template/features/products/data/models/create_product_request_dto.dart';
import 'package:test_flutter_template/features/products/data/models/product_dto.dart';
import 'package:test_flutter_template/features/products/data/models/product_list_response_dto.dart';
import 'package:test_flutter_template/features/products/data/models/update_product_request_dto.dart';
import 'package:test_flutter_template/features/profile/data/models/update_profile_request_dto.dart';

part 'serializers.g.dart';

@SerializersFor([
  PaginationMetaDto,
  BooleanFlag,
  ApiSuccessResponseDto,
  UserDto,
  AuthResponseDto,
  AuthApiResponseDto,
  LoginRequestDto,
  RegisterRequestDto,
  ProductDto,
  ProductListResponseDto,
  CreateProductRequestDto,
  UpdateProductRequestDto,
  UpdateProfileRequestDto,
])
final Serializers serializers =
    (_$serializers.toBuilder()
          ..addPlugin(IntToBoolPlugin())
          ..addPlugin(StringToNumberPlugin())
          ..addPlugin(StandardJsonPlugin()))
        .build();
