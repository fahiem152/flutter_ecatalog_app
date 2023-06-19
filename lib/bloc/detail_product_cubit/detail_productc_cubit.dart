// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';

import '../../data/models/responses/product_response_model.dart';

part 'detail_productc_cubit.freezed.dart';
part 'detail_productc_state.dart';

class DetailProductcCubit extends Cubit<DetailProductcState> {
  final ProductDataSource dataSource;
  DetailProductcCubit(
    this.dataSource,
  ) : super(DetailProductcState.initial());

  void getDetailProduct(String id) async {
    emit(const DetailProductcState.loading());
    final result = await dataSource.getDetailProduct(id);
    result.fold(
      (l) => emit(_$_Error(l)),
      (r) => emit(_$_Loaded(r)),
    );
  }
}
