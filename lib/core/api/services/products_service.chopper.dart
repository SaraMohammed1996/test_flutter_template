// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'products_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ProductsService extends ProductsService {
  _$ProductsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ProductsService;

  @override
  Future<Response<ProductListResponseDto>> getProducts({
    String? search,
    int? page,
  }) {
    final Uri $url = Uri.parse('/products');
    final Map<String, dynamic> $params = <String, dynamic>{
      'search': search,
      'page': page,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ProductListResponseDto, ProductListResponseDto>(
      $request,
    );
  }

  @override
  Future<Response<ProductDto>> createProduct(CreateProductRequestDto body) {
    final Uri $url = Uri.parse('/products');
    final $body = body;
    final Request $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ProductDto, ProductDto>($request);
  }

  @override
  Future<Response<ProductDto>> createProductMultipart({
    required String name,
    String? description,
    required String price,
    required String quantity,
    required String image,
  }) {
    final Uri $url = Uri.parse('/products');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>('name', name),
      PartValue<String?>('description', description),
      PartValue<String>('price', price),
      PartValue<String>('quantity', quantity),
      PartValueFile<String>('image', image),
    ];
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<ProductDto, ProductDto>($request);
  }

  @override
  Future<Response<ProductDto>> updateProduct(
    int id,
    UpdateProductRequestDto body,
  ) {
    final Uri $url = Uri.parse('/products/${id}');
    final $body = body;
    final Request $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<ProductDto, ProductDto>($request);
  }

  @override
  Future<Response<ProductDto>> updateProductMultipart(
    int id, {
    required String name,
    String? description,
    required String price,
    required String quantity,
    required String image,
  }) {
    final Uri $url = Uri.parse('/products/${id}');
    final List<PartValue> $parts = <PartValue>[
      PartValue<String>('name', name),
      PartValue<String?>('description', description),
      PartValue<String>('price', price),
      PartValue<String>('quantity', quantity),
      PartValueFile<String>('image', image),
    ];
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      parts: $parts,
      multipart: true,
    );
    return client.send<ProductDto, ProductDto>($request);
  }

  @override
  Future<Response<ApiSuccessResponseDto>> deleteProduct(int id) {
    final Uri $url = Uri.parse('/products/${id}');
    final Request $request = Request('DELETE', $url, client.baseUrl);
    return client.send<ApiSuccessResponseDto, ApiSuccessResponseDto>($request);
  }
}
