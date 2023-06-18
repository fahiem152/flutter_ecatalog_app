// To parse this JSON data, do
//
//     final loginFreezedResponseModel = loginFreezedResponseModelFromMap(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_freezed_response_model.freezed.dart';
part 'login_freezed_response_model.g.dart';

@freezed
class LoginFreezedResponseModel with _$LoginFreezedResponseModel {
  const factory LoginFreezedResponseModel({
    required String accessToken,
    required String refreshToken,
  }) = _LoginFreezedResponseModel;

  factory LoginFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginFreezedResponseModelFromJson(json);
}