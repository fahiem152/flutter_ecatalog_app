// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_freezed_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryFreezedResponseModel _$CategoryFreezedResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CategoryFreezedResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryFreezedResponseModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  DateTime get creationAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryFreezedResponseModelCopyWith<CategoryFreezedResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFreezedResponseModelCopyWith<$Res> {
  factory $CategoryFreezedResponseModelCopyWith(
          CategoryFreezedResponseModel value,
          $Res Function(CategoryFreezedResponseModel) then) =
      _$CategoryFreezedResponseModelCopyWithImpl<$Res,
          CategoryFreezedResponseModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String image,
      DateTime creationAt,
      DateTime updatedAt});
}

/// @nodoc
class _$CategoryFreezedResponseModelCopyWithImpl<$Res,
        $Val extends CategoryFreezedResponseModel>
    implements $CategoryFreezedResponseModelCopyWith<$Res> {
  _$CategoryFreezedResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? creationAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_CategoryFreezedResponseModelCopyWith<$Res>
    implements $CategoryFreezedResponseModelCopyWith<$Res> {
  factory _$$_CategoryFreezedResponseModelCopyWith(
          _$_CategoryFreezedResponseModel value,
          $Res Function(_$_CategoryFreezedResponseModel) then) =
      __$$_CategoryFreezedResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String image,
      DateTime creationAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_CategoryFreezedResponseModelCopyWithImpl<$Res>
    extends _$CategoryFreezedResponseModelCopyWithImpl<$Res,
        _$_CategoryFreezedResponseModel>
    implements _$$_CategoryFreezedResponseModelCopyWith<$Res> {
  __$$_CategoryFreezedResponseModelCopyWithImpl(
      _$_CategoryFreezedResponseModel _value,
      $Res Function(_$_CategoryFreezedResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? creationAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_CategoryFreezedResponseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
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
class _$_CategoryFreezedResponseModel implements _CategoryFreezedResponseModel {
  const _$_CategoryFreezedResponseModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.creationAt,
      required this.updatedAt});

  factory _$_CategoryFreezedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFreezedResponseModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final DateTime creationAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CategoryFreezedResponseModel(id: $id, name: $name, image: $image, creationAt: $creationAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryFreezedResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.creationAt, creationAt) ||
                other.creationAt == creationAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, image, creationAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryFreezedResponseModelCopyWith<_$_CategoryFreezedResponseModel>
      get copyWith => __$$_CategoryFreezedResponseModelCopyWithImpl<
          _$_CategoryFreezedResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryFreezedResponseModelToJson(
      this,
    );
  }
}

abstract class _CategoryFreezedResponseModel
    implements CategoryFreezedResponseModel {
  const factory _CategoryFreezedResponseModel(
      {required final int id,
      required final String name,
      required final String image,
      required final DateTime creationAt,
      required final DateTime updatedAt}) = _$_CategoryFreezedResponseModel;

  factory _CategoryFreezedResponseModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryFreezedResponseModel.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  DateTime get creationAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryFreezedResponseModelCopyWith<_$_CategoryFreezedResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}
