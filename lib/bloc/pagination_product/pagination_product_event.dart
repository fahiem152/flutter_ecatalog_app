part of 'pagination_product_bloc.dart';

abstract class PaginationProductEvent {}

class GetPaginationProductEvent extends PaginationProductEvent {}

class NextPaginationProductEvent extends PaginationProductEvent {}
