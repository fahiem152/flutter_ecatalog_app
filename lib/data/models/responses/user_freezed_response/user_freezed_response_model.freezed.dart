// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_freezed_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFreezedResponseModel _$UserFreezedResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserFreezedResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserFreezedResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get avatar => throw _privateConstructorUsedError;
  DateTime get creationAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFreezedResponseModelCopyWith<UserFreezedResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFreezedResponseModelCopyWith<$Res> {
  factory $UserFreezedResponseModelCopyWith(UserFreezedResponseModel value,
          $Res Function(UserFreezedResponseModel) then) =
      _$UserFreezedResponseModelCopyWithImpl<$Res, UserFreezedResponseModel>;
  @useResult
  $Res call(
      {int id,
      String email,
      String password,
      String name,
      String role,
      String avatar,
      DateTime creationAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserFreezedResponseModelCopyWithImpl<$Res,
        $Val extends UserFreezedResponseModel>
    implements $UserFreezedResponseModelCopyWith<$Res> {
  _$UserFreezedResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? role = null,
    Object? avatar = null,
    Object? creationAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      creationAt: null == creationAt
          ? _value.creationAt
          : creationAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserFreezedResponseModelCopyWith<$Res>
    implements $UserFreezedResponseModelCopyWith<$Res> {
  factory _$$_UserFreezedResponseModelCopyWith(
          _$_UserFreezedResponseModel value,
          $Res Function(_$_UserFreezedResponseModel) then) =
      __$$_UserFreezedResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String email,
      String password,
      String name,
      String role,
      String avatar,
      DateTime creationAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_UserFreezedResponseModelCopyWithImpl<$Res>
    extends _$UserFreezedResponseModelCopyWithImpl<$Res,
        _$_UserFreezedResponseModel>
    implements _$$_UserFreezedResponseModelCopyWith<$Res> {
  __$$_UserFreezedResponseModelCopyWithImpl(_$_UserFreezedResponseModel _value,
      $Res Function(_$_UserFreezedResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? password = null,
    Object? name = null,
    Object? role = null,
    Object? avatar = null,
    Object? creationAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_UserFreezedResponseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      avatar: null == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String,
      creationAt: null == creationAt
          ? _value.creationAt
          : creationAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserFreezedResponseModel implements _UserFreezedResponseModel {
  const _$_UserFreezedResponseModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.name,
      required this.role,
      required this.avatar,
      required this.creationAt,
      required this.updatedAt});

  factory _$_UserFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserFreezedResponseModelFromJson(json);

  @override
  final int id;
  @override
  final String email;
  @override
  final String password;
  @override
  final String name;
  @override
  final String role;
  @override
  final String avatar;
  @override
  final DateTime creationAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserFreezedResponseModel(id: $id, email: $email, password: $password, name: $name, role: $role, avatar: $avatar, creationAt: $creationAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserFreezedResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.creationAt, creationAt) ||
                other.creationAt == creationAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, password, name, role,
      avatar, creationAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserFreezedResponseModelCopyWith<_$_UserFreezedResponseModel>
      get copyWith => __$$_UserFreezedResponseModelCopyWithImpl<
          _$_UserFreezedResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserFreezedResponseModelToJson(
      this,
    );
  }
}

abstract class _UserFreezedResponseModel implements UserFreezedResponseModel {
  const factory _UserFreezedResponseModel(
      {required final int id,
      required final String email,
      required final String password,
      required final String name,
      required final String role,
      required final String avatar,
      required final DateTime creationAt,
      required final DateTime updatedAt}) = _$_UserFreezedResponseModel;

  factory _UserFreezedResponseModel.fromJson(Map<String, dynamic> json) =
      _$_UserFreezedResponseModel.fromJson;

  @override
  int get id;
  @override
  String get email;
  @override
  String get password;
  @override
  String get name;
  @override
  String get role;
  @override
  String get avatar;
  @override
  DateTime get creationAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserFreezedResponseModelCopyWith<_$_UserFreezedResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
