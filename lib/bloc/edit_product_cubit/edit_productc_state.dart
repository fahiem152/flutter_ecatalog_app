part of 'edit_productc_cubit.dart';

@freezed
class EditProductcState with _$EditProductcState {
  const factory EditProductcState.initial() = _Initial;
  const factory EditProductcState.loading() = _Loading;
  const factory EditProductcState.loaded(ProductResponseModel model) = _Loaded;
  const factory EditProductcState.error(String message) = _Error;
}
