// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/datasources/product_datasource.dart';
import '../../data/models/responses/product_response_model.dart';

part 'pagination_product_event.dart';
part 'pagination_product_state.dart';

class PaginationProductBloc
    extends Bloc<PaginationProductEvent, PaginationProductState> {
  final ProductDataSource dataSource;
  PaginationProductBloc(
    this.dataSource,
  ) : super(PaginationProductInitial()) {
    on<GetPaginationProductEvent>((event, emit) async {
      emit(PaginationProductLoading());
      final result =
          await dataSource.getProudctPagination(event.offset, event.limit);
      result.fold(
        (l) => emit(PaginationProductError(message: l)),
        (r) => emit(
          PaginationProductLoaded(
            data: r,
          ),
        ),
      );
    });
  }
}
