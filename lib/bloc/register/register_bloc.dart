import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/datasources/auth_datasource.dart';

import '../../data/models/requests/regieter_request_model.dart';
import '../../data/models/responses/register_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthDatasource datasource;

  RegisterBloc(this.datasource) : super(RegisterInitial()) {
    on<DoRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      final result = await datasource.register(event.model);
      result.fold(
        (l) => emit(RegisterError(message: l)),
        (r) => emit(
          RegisterLoaded(
            model: r,
          ),
        ),
      );
      // TODO: implement event handler
    });
  }
}
