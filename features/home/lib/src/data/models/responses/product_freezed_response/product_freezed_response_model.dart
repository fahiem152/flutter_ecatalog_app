import 'package:dependencies/dependencies.dart';

part 'product_freezed_response_model.freezed.dart';
part 'product_freezed_response_model.g.dart';

@freezed
class ProductFreezedResponseModel with _$ProductFreezedResponseModel {
  const factory ProductFreezedResponseModel({
    required int id,
    required String title,
    required int price,
    required String description,
    required List<String> images,
    required DateTime creationAt,
    required DateTime updatedAt,
    required Category category,
  }) = _ProductFreezedResponseModel;

  factory ProductFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFreezedResponseModelFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required String image,
    required DateTime creationAt,
    required DateTime updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
