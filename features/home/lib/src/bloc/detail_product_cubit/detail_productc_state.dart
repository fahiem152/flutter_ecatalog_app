part of 'detail_productc_cubit.dart';

@freezed
class DetailProductcState with _$DetailProductcState {
  const factory DetailProductcState.initial() = _Initial;
  const factory DetailProductcState.loading() = _Loading;
  const factory DetailProductcState.loaded(
    ProductResponseModel model,
  ) = _Loaded;
  const factory DetailProductcState.error(String message) = _Error;
}
