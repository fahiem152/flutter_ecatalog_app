// To parse this JSON data, do
//
//     final registerFreezedResponseModel = registerFreezedResponseModelFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_freezed_response_model.freezed.dart';
part 'register_freezed_response_model.g.dart';

@freezed
class RegisterFreezedResponseModel with _$RegisterFreezedResponseModel {
  const factory RegisterFreezedResponseModel({
    required String email,
    required String password,
    required String name,
    required String avatar,
    required String role,
    required int id,
    required DateTime creationAt,
    required DateTime updatedAt,
  }) = _RegisterFreezedResponseModel;

  factory RegisterFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterFreezedResponseModelFromJson(json);
}
