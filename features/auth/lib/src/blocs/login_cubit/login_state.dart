part of 'login_cubit.dart';

@freezed
class LoginCubitState with _$LoginCubitState {
  const factory LoginCubitState.initial() = _Initial;
  const factory LoginCubitState.loading() = _Loading;
  const factory LoginCubitState.loaded(LoginFreezedResponseModel model) =
      _Loaded;
  // const factory LoginCubitState.loaded(LoginResponseModel model) = _Loaded;
  const factory LoginCubitState.error(String message) = _Error;
}
