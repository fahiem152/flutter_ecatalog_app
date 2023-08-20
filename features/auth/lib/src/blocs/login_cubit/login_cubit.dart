// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/models/requests/login_request_model.dart';
import '../../data/models/responses/login_freezed_response/login_freezed_response_model.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final AuthRemoteDatasource datasource;
  LoginCubit(
    this.datasource,
  ) : super(const LoginCubitState.initial());

  void loginCubit(LoginRequestModel model) async {
    emit(const _$_Loading());
    final result = await datasource.login(model);
    result.fold(
      (l) => emit(
        _Error(
          l,
        ),
      ),
      (r) => emit(
        _Loaded(
          r,
        ),
      ),
    );
  }
}
