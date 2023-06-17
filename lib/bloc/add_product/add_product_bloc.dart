// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/datasources/product_datasource.dart';

import '../../data/models/requests/product_request_model.dart';
import '../../data/models/responses/product_response_model.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  final ProductDataSource dataSource;
  AddProductBloc(
    this.dataSource,
  ) : super(AddProductInitial()) {
    on<DoAddProductEvent>((event, emit) async {
      emit(AddProductLoading());
      final result = await dataSource.createProduct(event.model);
      result.fold(
          (l) => emit(AddProductError(message: l)),
          (r) => emit(
                AddProductLoaded(
                  model: r,
                ),
              ));
    });
  }
}
