part of 'category_cubit.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = _Initial;
  const factory CategoryState.loading() = _Loading;
  const factory CategoryState.loaded(List<CategoryFreezedResponseModel> model) =
      _Loaded;
  const factory CategoryState.error(String message) = _Error;
}
