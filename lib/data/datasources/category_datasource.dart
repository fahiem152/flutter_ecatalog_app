import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../models/requests/category_freezed_request/category_freezed_request_model.dart';
import '../models/responses/category_freezed_response/category_freezed_response_model.dart';
import '../models/responses/upload_response/upload_response_model.dart';

class CategoryDataSource {
  Future<Either<String, List<CategoryFreezedResponseModel>>>
      getAllCategory() async {
    final response = await http.get(
      Uri.parse(
        'https://api.escuelajs.co/api/v1/categories/',
      ),
    );
    debugPrint('category: ${response.body}');
    if (response.statusCode == 200) {
      return Right(
        List<CategoryFreezedResponseModel>.from(
          jsonDecode(response.body).map(
            (e) => CategoryFreezedResponseModel.fromJson(e),
          ),
        ),
      );
    } else {
      return const Left('Gagal Get All Category');
    }
  }

  Future<Either<String, CategoryFreezedResponseModel>> createCategory(
      CategoryFreezedRequestModel model) async {
    final response = await http.post(
      Uri.parse(
        'https://api.escuelajs.co/api/v1/categories/',
      ),
      body: jsonEncode(model),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return Right(
        CategoryFreezedResponseModel.fromJson(
          jsonDecode(
            response.body,
          ),
        ),
      );
    } else {
      return const Left('Gagal Craete Category');
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
