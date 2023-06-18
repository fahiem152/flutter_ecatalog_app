// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';

import '../../data/models/responses/product_freezed_response/product_freezed_response_model.dart';
import '../../data/models/responses/product_response_model.dart';

part 'productsc_cubit.freezed.dart';
part 'productsc_state.dart';

class ProductscCubit extends Cubit<ProductscState> {
  final ProductDataSource dataSource;
  ProductscCubit(
    this.dataSource,
  ) : super(const ProductscState.initial());

  void getProducts() async {
    emit(const _Loading());
    final result = await dataSource.getProudctPagination(offset: 0, limit: 20);

    result.fold((l) => emit(_Error(l)), (r) {
      debugPrint("result length: ${r.toString()}");
      bool isNext = r.length == 20;
      emit(
        _Loaded(r, 0, 20, isNext),
      );
    });
  }

  void nextGetProducts() async {
    final currentState = state as _Loaded;
    final result = await dataSource.getProudctPagination(
        offset: currentState.offset + 20, limit: 20);

    result.fold(
      (l) => emit(_Error(l)),
      (r) {
        bool isNext = r.length == 20;
        emit(
          _Loaded(
            [...currentState.data, ...r],
            currentState.offset + 20,
            20,
            isNext,
          ),
        );
      },
    );
  }
}
