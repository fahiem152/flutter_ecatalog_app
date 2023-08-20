// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_freezed_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RegisterFreezedResponseModel _$$_RegisterFreezedResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_RegisterFreezedResponseModel(
      email: json['email'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
      avatar: json['avatar'] as String,
      role: json['role'] as String,
      id: json['id'] as int,
      creationAt: DateTime.parse(json['creationAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_RegisterFreezedResponseModelToJson(
        _$_RegisterFreezedResponseModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'avatar': instance.avatar,
      'role': instance.role,
      'id': instance.id,
      'creationAt': instance.creationAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
