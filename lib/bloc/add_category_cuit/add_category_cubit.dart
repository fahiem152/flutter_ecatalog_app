// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/data/models/requests/category_freezed_request/category_freezed_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_ecatalog/data/datasources/category_datasource.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/models/responses/category_freezed_response/category_freezed_response_model.dart';

part 'add_category_cubit.freezed.dart';
part 'add_category_state.dart';

class AddCategoryCubit extends Cubit<AddCategoryState> {
  final CategoryDataSource dataSource;
  AddCategoryCubit(
    this.dataSource,
  ) : super(AddCategoryState.initial());

  void addCategory(CategoryFreezedRequestModel model, XFile image) async {
    emit(const _Loading());
    final uploadResult = await dataSource.uploadImage(image);
    uploadResult.fold((l) => emit(_Error(l)), (r) async {
      final result = await dataSource.createCategory(
        model.copyWith(
          image: r.location,
        ),
      );

      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(
          _Loaded(
            r,
          ),
        ),
      );
    });
  }
}
