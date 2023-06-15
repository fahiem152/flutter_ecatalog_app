import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecatalog/data/models/requests/product_request_model.dart';

import '../models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductDataSource {
  Future<Either<String, List<ProductResponseModel>>> getAllProudct() async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products/'),
      headers: {'Content-Type': 'application/json'},
    );
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return Right(
        List<ProductResponseModel>.from(
          jsonDecode(response.body).map(
            (e) => ProductResponseModel.fromMap(
              e,
            ),
          ),
        ),
      );
    } else {
      return const Left('get Product error');
    }
  }

  Future<Either<String, List<ProductResponseModel>>> getProudctPagination(
      {required int offset, required int limit}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.escuelajs.co/api/v1/products/?offset=$offset&limit=$limit'),
      // headers: {'Content-Type': 'application/json'},
    );
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return Right(
        List<ProductResponseModel>.from(
          jsonDecode(response.body).map(
            (e) => ProductResponseModel.fromMap(
              e,
            ),
          ),
        ),
      );
    } else {
      return const Left('get Product error');
    }
  }

  Future<Either<String, ProductResponseModel>> createProduct(
      ProductRequestModel model) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/products/'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      return Right(
        ProductResponseModel.fromJson(response.body),
      );
    } else {
      return const Left('Gagal Create Product');
    }
  }

  Future<Either<String, ProductResponseModel>> editProduct(
      ProductRequestModel model, final String idProduct) async {
    final response = await http.put(
      Uri.parse('https://api.escuelajs.co/api/v1/products/${idProduct}'),
      body: model.toJson(),
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    debugPrint(idProduct.toString());

    if (response.statusCode == 200) {
      return Right(
        ProductResponseModel.fromJson(response.body),
      );
    } else {
      return const Left('Gagal Create Product');
    }
  }
}
