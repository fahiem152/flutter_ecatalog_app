import 'package:dependencies/dependencies.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/models/requests/login_request_model.dart';
import '../../data/models/responses/login_freezed_response/login_freezed_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource datasource;
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
