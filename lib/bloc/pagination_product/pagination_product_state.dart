// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pagination_product_bloc.dart';

@immutable
abstract class PaginationProductState {}

class PaginationProductInitial extends PaginationProductState {}

class PaginationProductLoading extends PaginationProductState {
  final List<ProductResponseModel> data;
  PaginationProductLoading({
    required this.data,
  });
}

class PaginationProductLoaded extends PaginationProductState {
  final List<ProductResponseModel> data;

  PaginationProductLoaded({
    required this.data,
  });
}

class PaginationProductError extends PaginationProductState {
  final String message;
  PaginationProductError({
    required this.message,
  });
}
