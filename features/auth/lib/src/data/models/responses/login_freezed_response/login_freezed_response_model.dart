// To parse this JSON data, do
//
//     final loginFreezedResponseModel = loginFreezedResponseModelFromMap(jsonString);

import 'package:dependencies/dependencies.dart';

part 'login_freezed_response_model.freezed.dart';
part 'login_freezed_response_model.g.dart';

@freezed
class LoginFreezedResponseModel with _$LoginFreezedResponseModel {
  const factory LoginFreezedResponseModel({
    required String access_token,
    required String refresh_token,
  }) = _LoginFreezedResponseModel;

  factory LoginFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginFreezedResponseModelFromJson(json);
}
