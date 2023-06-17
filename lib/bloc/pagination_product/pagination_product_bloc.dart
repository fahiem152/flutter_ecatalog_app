// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      // if (state is PaginationProductLoading) return;
      // final currentState = state;
      // List<ProductResponseModel> oldData = [];
      // if (currentState is PaginationProductLoaded) {
      //   oldData = event.offset == 0 ? [] : currentState.data;
      // }
      // emit(PaginationProductLoading(data: oldData));

      // final result =
      //     await dataSource.getProudctPagination(event.offset, event.limit);
      // List<ProductResponseModel> newData = [];
      // newData = oldData;
      // result.fold(
      //   (l) => emit(PaginationProductError(message: l)),
      //   (r) => {
      //     newData.addAll(
      //       r,
      //     ),
      //     emit(PaginationProductLoaded(data: newData)),
      //   },
      // );

      emit(PaginationProductLoading());
      final result =
          await dataSource.getProudctPagination(offset: 0, limit: 20);
      result.fold(
        (error) => emit(PaginationProductError(message: error)),
        (result) {
          bool isNext = result.length == 20;
          emit(PaginationProductLoaded(data: result, isNext: isNext));
        },
      );
    });
    on<NextPaginationProductEvent>((event, emit) async {
      final currentState = state as PaginationProductLoaded;
      final result = await dataSource.getProudctPagination(
          offset: currentState.offset + 20, limit: 20);
      result.fold(
        (error) => emit(PaginationProductError(message: error)),
        (result) {
          bool isNext = result.length == 20;
          emit(
            PaginationProductLoaded(
              data: [...currentState.data, ...result],
              offset: currentState.offset + 20,
              isNext: isNext,
            ),
          );
          // emit(currentState.copyWith(
          //     data: [...currentState.data, ...result],
          //     offset: currentState.offset + 20,
          //     isNext: isNext));
        },
      );
    });
  }
}
