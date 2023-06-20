// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/models/requests/regieter_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';

import '../../data/models/responses/register_frezeed_response/register_freezed_response_model.dart';

part 'register_cubit_cubit.freezed.dart';
part 'register_cubit_state.dart';

class RegisterCubitCubit extends Cubit<RegisterCubitState> {
  final AuthDatasource datasource;
  RegisterCubitCubit(
    this.datasource,
  ) : super(const RegisterCubitState.initial());

  void registerCubit(RegisterRequestModel model) async {
    emit(const _Loading());
    final result = await datasource.register(model);
    result.fold(
      (l) => emit(_Error(l)),
      (r) => emit(
        _Loaded(
          r,
        ),
      ),
    );
  }
}
