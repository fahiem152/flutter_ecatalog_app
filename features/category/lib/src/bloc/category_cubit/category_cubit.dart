// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dependencies/dependencies.dart';

import '../../data/datasources/category_datasource.dart';
import '../../data/models/responses/category_freezed_response/category_freezed_response_model.dart';

part 'category_cubit.freezed.dart';
part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryDataSource dataSource;
  CategoryCubit(
    this.dataSource,
  ) : super(const CategoryState.initial());

  void getAllCategory() async {
    emit(const _$_Loading());

    final result = await dataSource.getAllCategory();
    result.fold((l) => emit(_$_Error(l)), (r) => emit(_Loaded(r)));
  }
}
