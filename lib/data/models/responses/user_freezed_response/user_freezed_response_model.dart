import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_freezed_response_model.freezed.dart';
part 'user_freezed_response_model.g.dart';

@freezed
class UserFreezedResponseModel with _$UserFreezedResponseModel {
  const factory UserFreezedResponseModel({
    required int id,
    required String email,
    required String password,
    required String name,
    required String role,
    required String avatar,
    required DateTime creationAt,
    required DateTime updatedAt,
  }) = _UserFreezedResponseModel;

  factory UserFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserFreezedResponseModelFromJson(json);
}
