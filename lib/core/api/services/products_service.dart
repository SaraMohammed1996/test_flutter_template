import 'package:chopper/chopper.dart';
import 'package:test_flutter_template/core/api/models/api_success_response_dto.dart';
import 'package:test_flutter_template/features/products/data/models/create_product_request_dto.dart';
import 'package:test_flutter_template/features/products/data/models/product_dto.dart';
import 'package:test_flutter_template/features/products/data/models/product_list_response_dto.dart';
import 'package:test_flutter_template/features/products/data/models/update_product_request_dto.dart';

part 'products_service.chopper.dart';

@ChopperApi()
abstract class ProductsService extends ChopperService {
  static ProductsService create([ChopperClient? client]) =>
      _$ProductsService(client);

  @GET(path: '/products')
  Future<Response<ProductListResponseDto>> getProducts({
    @Query('search') String? search,
    @Query('page') int? page,
  });

  @POST(path: '/products')
  Future<Response<ProductDto>> createProduct(
    @Body() CreateProductRequestDto body,
  );

  @POST(path: '/products')
  @Multipart()
  Future<Response<ProductDto>> createProductMultipart({
    @Part('name') required String name,
    @Part('description') String? description,
    @Part('price') required String price,
    @Part('quantity') required String quantity,
    @PartFile('image') required String image,
  });

  @PUT(path: '/products/{id}')
  Future<Response<ProductDto>> updateProduct(
    @Path('id') int id,
    @Body() UpdateProductRequestDto body,
  );

  @PUT(path: '/products/{id}')
  @Multipart()
  Future<Response<ProductDto>> updateProductMultipart(
    @Path('id') int id, {
    @Part('name') required String name,
    @Part('description') String? description,
    @Part('price') required String price,
    @Part('quantity') required String quantity,
    @PartFile('image') required String image,
  });

  @DELETE(path: '/products/{id}')
  Future<Response<ApiSuccessResponseDto>> deleteProduct(@Path('id') int id);
}
