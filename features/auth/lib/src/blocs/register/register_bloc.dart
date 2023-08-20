import 'package:dependencies/dependencies.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/models/requests/register_request_model.dart';
import '../../data/models/responses/register_frezeed_response/register_freezed_response_model.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRemoteDatasource datasource;

  RegisterBloc(this.datasource) : super(RegisterInitial()) {
    // on<DoRegisterEvent>((event, emit) async {
    //   emit(RegisterLoading());
    //   final result = await datasource.register(event.model);
    //   result.fold(
    //     (l) => emit(RegisterError(message: l)),
    //     (r) => emit(
    //       RegisterLoaded(
    //         model: r,
    //       ),
    //     ),
    //   );
    // });
  }
}
