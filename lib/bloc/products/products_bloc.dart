// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../features/home/lib/src/data/datasources/product_datasource.dart';

// import '../../data/models/responses/product_response_model.dart';

// part 'products_event.dart';
// part 'products_state.dart';

// class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
//   final ProductDataSource dataSource;
//   ProductsBloc(this.dataSource) : super(ProductsInitial()) {
//     on<GetProductsEvent>((event, emit) async {
//       emit(ProductsLoading());
//       final result = await dataSource.getAllProudct();
//       result.fold(
//         (l) => emit(ProductsError(message: l)),
//         (r) => emit(
//           ProductsLoaded(data: r),
//         ),
//       );
//     });
//   }
// }
