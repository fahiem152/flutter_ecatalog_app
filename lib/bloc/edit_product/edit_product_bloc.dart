// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../features/home/lib/src/data/datasources/product_datasource.dart';
// import '../../../features/home/lib/src/data/models/requests/product_request_model.dart';
// import 'package:flutter_ecatalog/data/models/responses/product_response_model.dart';

// part 'edit_product_event.dart';
// part 'edit_product_state.dart';

// class EditProductBloc extends Bloc<EditProductEvent, EditProductState> {
//   final ProductDataSource dataSource;
//   EditProductBloc(
//     this.dataSource,
//   ) : super(EditProductInitial()) {
//     on<DoEditProductEvent>((event, emit) async {
//       emit(EditProductLoading());
//       final result = await dataSource.editProduct(event.model, event.idProduct);
//       result.fold(
//           (l) => emit(
//                 EditProductError(
//                   message: l,
//                 ),
//               ),
//           (r) => emit(EditProductLoaded(
//                 model: r,
//               )));
//     });
//   }
// }
