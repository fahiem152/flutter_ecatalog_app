import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_freezed_request_model.freezed.dart';
part 'category_freezed_request_model.g.dart';

@freezed
class CategoryFreezedRequestModel with _$CategoryFreezedRequestModel {
  const factory CategoryFreezedRequestModel({
    required String name,
    @Default(
      "https://api.lorem.space/image/book?w=150&h=220",
    )
    String image,
  }) = _CategoryFreezedRequestModel;

  factory CategoryFreezedRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryFreezedRequestModelFromJson(json);
}
