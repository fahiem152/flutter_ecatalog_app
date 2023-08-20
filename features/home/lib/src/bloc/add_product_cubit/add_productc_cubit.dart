// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dependencies/dependencies.dart';

import '../../data/data.dart';

part 'add_productc_cubit.freezed.dart';
part 'add_productc_state.dart';

class AddProductcCubit extends Cubit<AddProductcState> {
  final ProductDataSource dataSource;
  AddProductcCubit(
    this.dataSource,
  ) : super(const AddProductcState.initial());

  void addProduct(ProductRequestModel model, XFile image) async {
    emit(const _Loading());
    final uploadResult = await dataSource.uploadImage(image);
    uploadResult.fold((l) => emit(_Error(l)), (dataUpload) async {
      final result = await dataSource.createProduct(model.copyWith(images: [
        dataUpload.location,
      ]));
      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(
          _Loaded(r),
        ),
      );
    });
  }
}
