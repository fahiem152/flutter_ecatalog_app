import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';

import '../../data/models/requests/product_request_model.dart';
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
