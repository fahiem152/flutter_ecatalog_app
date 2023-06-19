import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecatalog/data/models/requests/product_request_model.dart';
import 'package:image_picker/image_picker.dart';

import '../models/responses/product_freezed_response/product_freezed_response_model.dart';
import '../models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/responses/upload_response/upload_response_model.dart';

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

  Future<Either<String, List<ProductFreezedResponseModel>>>
      getProudctPagination({required int offset, required int limit}) async {
    final response = await http.get(
      Uri.parse(
          'https://api.escuelajs.co/api/v1/products/?offset=$offset&limit=$limit'),
      // headers: {'Content-Type': 'application/json'},
    );
    debugPrint(response.body);

    if (response.statusCode == 200) {
      return Right(
        List<ProductFreezedResponseModel>.from(
          jsonDecode(response.body)
              .map((e) => ProductFreezedResponseModel.fromJson(e)),
        ),
      );
    } else {
      return const Left('get Product error');
    }
  }
  // Future<Either<String, List<ProductResponseModel>>> getProudctPagination(
  //     {required int offset, required int limit}) async {
  //   final response = await http.get(
  //     Uri.parse(
  //         'https://api.escuelajs.co/api/v1/products/?offset=$offset&limit=$limit'),
  //     // headers: {'Content-Type': 'application/json'},
  //   );
  //   debugPrint(response.body);

  //   if (response.statusCode == 200) {
  //     return Right(
  //       List<ProductResponseModel>.from(
  //         jsonDecode(response.body).map(
  //           (e) => ProductResponseModel.fromMap(
  //             e,
  //           ),
  //         ),
  //       ),
  //     );
  //   } else {
  //     return const Left('get Product error');
  //   }
  // }

  Future<Either<String, ProductResponseModel>> getDetailProduct(
      final String idProduct) async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products/$idProduct'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return Right(
        ProductResponseModel.fromJson(response.body),
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
      Uri.parse('https://api.escuelajs.co/api/v1/products/$idProduct'),
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

  Future<Either<String, UploadResponseModel>> uploadImage(XFile image) async {
    final requset = http.MultipartRequest(
        'POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));

    final bytes = await image.readAsBytes();
    final multiPartFile = http.MultipartFile.fromBytes(
      'file',
      bytes,
      filename: image.name,
    );
    requset.files.add(multiPartFile);
    http.StreamedResponse response = await requset.send();
    final Uint8List responseList = await response.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);
    if (response.statusCode == 201) {
      return Right(
        UploadResponseModel.fromJson(
          jsonDecode(
            responseData,
          ),
        ),
      );
    } else {
      return const Left(
        'error upload image',
      );
    }
  }
}
