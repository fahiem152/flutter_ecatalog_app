// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_freezed_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoryFreezedRequestModel _$CategoryFreezedRequestModelFromJson(
    Map<String, dynamic> json) {
  return _CategoryFreezedRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryFreezedRequestModel {
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryFreezedRequestModelCopyWith<CategoryFreezedRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryFreezedRequestModelCopyWith<$Res> {
  factory $CategoryFreezedRequestModelCopyWith(
          CategoryFreezedRequestModel value,
          $Res Function(CategoryFreezedRequestModel) then) =
      _$CategoryFreezedRequestModelCopyWithImpl<$Res,
          CategoryFreezedRequestModel>;
  @useResult
  $Res call({String name, String image});
}

/// @nodoc
class _$CategoryFreezedRequestModelCopyWithImpl<$Res,
        $Val extends CategoryFreezedRequestModel>
    implements $CategoryFreezedRequestModelCopyWith<$Res> {
  _$CategoryFreezedRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryFreezedRequestModelCopyWith<$Res>
    implements $CategoryFreezedRequestModelCopyWith<$Res> {
  factory _$$_CategoryFreezedRequestModelCopyWith(
          _$_CategoryFreezedRequestModel value,
          $Res Function(_$_CategoryFreezedRequestModel) then) =
      __$$_CategoryFreezedRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String image});
}

/// @nodoc
class __$$_CategoryFreezedRequestModelCopyWithImpl<$Res>
    extends _$CategoryFreezedRequestModelCopyWithImpl<$Res,
        _$_CategoryFreezedRequestModel>
    implements _$$_CategoryFreezedRequestModelCopyWith<$Res> {
  __$$_CategoryFreezedRequestModelCopyWithImpl(
      _$_CategoryFreezedRequestModel _value,
      $Res Function(_$_CategoryFreezedRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
  }) {
    return _then(_$_CategoryFreezedRequestModel(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoryFreezedRequestModel implements _CategoryFreezedRequestModel {
  const _$_CategoryFreezedRequestModel(
      {required this.name,
      this.image = "https://api.lorem.space/image/book?w=150&h=220"});

  factory _$_CategoryFreezedRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFreezedRequestModelFromJson(json);

  @override
  final String name;
  @override
  @JsonKey()
  final String image;

  @override
  String toString() {
    return 'CategoryFreezedRequestModel(name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoryFreezedRequestModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryFreezedRequestModelCopyWith<_$_CategoryFreezedRequestModel>
      get copyWith => __$$_CategoryFreezedRequestModelCopyWithImpl<
          _$_CategoryFreezedRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryFreezedRequestModelToJson(
      this,
    );
  }
}

abstract class _CategoryFreezedRequestModel
    implements CategoryFreezedRequestModel {
  const factory _CategoryFreezedRequestModel(
      {required final String name,
      final String image}) = _$_CategoryFreezedRequestModel;

  factory _CategoryFreezedRequestModel.fromJson(Map<String, dynamic> json) =
      _$_CategoryFreezedRequestModel.fromJson;

  @override
  String get name;
  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryFreezedRequestModelCopyWith<_$_CategoryFreezedRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
