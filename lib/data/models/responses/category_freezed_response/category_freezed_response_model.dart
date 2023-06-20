import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_freezed_response_model.freezed.dart';
part 'category_freezed_response_model.g.dart';

@freezed
class CategoryFreezedResponseModel with _$CategoryFreezedResponseModel {
  const factory CategoryFreezedResponseModel({
    required int id,
    required String name,
    required String image,
    required DateTime creationAt,
    required DateTime updatedAt,
  }) = _CategoryFreezedResponseModel;

  factory CategoryFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryFreezedResponseModelFromJson(json);
}
