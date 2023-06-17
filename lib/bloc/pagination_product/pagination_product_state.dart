// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'pagination_product_bloc.dart';

abstract class PaginationProductState extends Equatable {}

class PaginationProductInitial extends PaginationProductState {
  @override
  List<Object?> get props => [];
}

class PaginationProductLoading extends PaginationProductState {
  @override
  List<Object?> get props => [];
}

class PaginationProductLoaded extends PaginationProductState {
  final List<ProductResponseModel> data;
  final int offset;
  final int limit;
  final bool isNext;
  PaginationProductLoaded({
    required this.data,
    this.offset = 0,
    this.limit = 20,
    this.isNext = false,
  });

  PaginationProductLoaded copyWith({
    List<ProductResponseModel>? data,
    int? offset,
    int? limit,
    bool? isNext,
  }) {
    return PaginationProductLoaded(
      data: data ?? this.data,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      isNext: isNext ?? this.isNext,
    );
  }

  @override
  List<Object?> get props => [offset, limit, isNext];
}

class PaginationProductError extends PaginationProductState {
  final String message;
  PaginationProductError({
    required this.message,
  });

  @override
  List<Object?> get props => [];
}
