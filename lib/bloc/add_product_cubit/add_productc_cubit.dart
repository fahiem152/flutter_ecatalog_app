// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';

import '../../data/models/requests/product_request_model.dart';
import '../../data/models/responses/product_response_model.dart';

part 'add_productc_cubit.freezed.dart';
part 'add_productc_state.dart';

class AddProductcCubit extends Cubit<AddProductcState> {
  final ProductDataSource dataSource;
  AddProductcCubit(
    this.dataSource,
  ) : super(const AddProductcState.initial());

  void addProduct(ProductRequestModel model) async {
    emit(const _Loading());
    final result = await dataSource.createProduct(model);
    result.fold(
      (l) => emit(_Error(l)),
      (r) => emit(
        _$_Loaded(r),
      ),
    );
  }
}
