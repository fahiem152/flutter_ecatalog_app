// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_freezed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryFreezedResponseModel _$$_CategoryFreezedResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_CategoryFreezedResponseModel(
      id: json['id'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      creationAt: DateTime.parse(json['creationAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_CategoryFreezedResponseModelToJson(
        _$_CategoryFreezedResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'creationAt': instance.creationAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
