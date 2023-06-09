import 'package:bloc/bloc.dart';
import 'package:flutter_ecatalog/data/models/requests/login_request_model.dart';
import 'package:flutter_ecatalog/data/models/responses/login_response_model.dart';
import 'package:meta/meta.dart';

import '../../data/datasources/auth_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthDatasource datasource;
  LoginBloc(this.datasource) : super(LoginInitial()) {
    on<DoLoginEvent>(
      (event, emit) async {
        emit(LoginLoading());
        final result = await datasource.login(event.model);
        result.fold((l) => emit(LoginError(message: l)),
            (r) => emit(LoginLoaded(model: r)));
      },
    );
  }
}
