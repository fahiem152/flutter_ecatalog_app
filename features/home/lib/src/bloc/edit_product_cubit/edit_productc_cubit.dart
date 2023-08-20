import 'package:dependencies/dependencies.dart';

import '../../data/data.dart';
import '../../data/models/responses/product_response_model.dart';

part 'edit_productc_cubit.freezed.dart';
part 'edit_productc_state.dart';

class EditProductcCubit extends Cubit<EditProductcState> {
  final ProductDataSource dataSource;
  EditProductcCubit(
    this.dataSource,
  ) : super(const EditProductcState.initial());

  void editProduct(ProductRequestModel model, String idProduct) async {
    emit(const _Loading());
    final result = await dataSource.editProduct(model, idProduct);
    result.fold(
      (l) => emit(
        _Error(
          l,
        ),
      ),
      (r) => emit(
        _Loaded(r),
      ),
    );
  }
}
