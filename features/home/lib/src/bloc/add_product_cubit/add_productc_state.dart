part of 'add_productc_cubit.dart';

@freezed
class AddProductcState with _$AddProductcState {
  const factory AddProductcState.initial() = _Initial;
  const factory AddProductcState.loading() = _Loading;
  const factory AddProductcState.loaded(
    ProductResponseModel model,
  ) = _Loaded;
  const factory AddProductcState.error(String message) = _Error;
}
