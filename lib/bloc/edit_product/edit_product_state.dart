part of 'edit_product_bloc.dart';

@immutable
abstract class EditProductState {}

class EditProductInitial extends EditProductState {}

class EditProductLoading extends EditProductState {}

class EditProductLoaded extends EditProductState {
  final ProductResponseModel model;
  EditProductLoaded({
    required this.model,
  });
}

class EditProductError extends EditProductState {
  final String message;
  EditProductError({
    required this.message,
  });
}
