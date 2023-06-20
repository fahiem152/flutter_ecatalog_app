// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_freezed_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryFreezedRequestModel _$$_CategoryFreezedRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryFreezedRequestModel(
      name: json['name'] as String,
      image: json['image'] as String? ??
          "https://api.lorem.space/image/book?w=150&h=220",
    );

Map<String, dynamic> _$$_CategoryFreezedRequestModelToJson(
        _$_CategoryFreezedRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
