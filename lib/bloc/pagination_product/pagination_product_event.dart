part of 'pagination_product_bloc.dart';

@immutable
abstract class PaginationProductEvent {}

class GetPaginationProductEvent extends PaginationProductEvent {
  final int offset;
  final int limit;
  GetPaginationProductEvent({
    required this.offset,
    required this.limit,
  });
}

// class LoadMoreProducts extends PaginationProductEvent {
//   final int offset;
//   final int limit;
//   LoadMoreProducts({
//     required this.offset,
//     required this.limit,
//   });
// }
