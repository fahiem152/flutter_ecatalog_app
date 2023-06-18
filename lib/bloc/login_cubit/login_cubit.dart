// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/models/requests/login_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';

import '../../data/models/responses/login_freezed_response/login_freezed_response_model.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final AuthDatasource datasource;
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
