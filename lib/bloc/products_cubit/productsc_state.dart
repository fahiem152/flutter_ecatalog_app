part of 'productsc_cubit.dart';

@freezed
class ProductscState with _$ProductscState {
  const factory ProductscState.initial() = _Initial;
  const factory ProductscState.loading() = _Loading;
  const factory ProductscState.loaded(
    List<ProductFreezedResponseModel> data,
    int offset,
    int limit,
    bool isNext,
  ) = _Loaded;
  // const factory ProductscState.loaded(
  //   List<ProductResponseModel> data,
  //   int offset,
  //   int limit,
  //   bool isNext,
  // ) = _Loaded;
  const factory ProductscState.error(String message) = _Error;
}
