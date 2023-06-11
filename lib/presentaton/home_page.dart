import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/pagination_product/pagination_product_bloc.dart';
import 'package:flutter_ecatalog/bloc/products/products_bloc.dart';
import 'package:flutter_ecatalog/presentaton/add_product_page.dart';
import 'package:flutter_ecatalog/presentaton/edit_product_page.dart';

import '../data/datasources/local_datasource.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int offset = 0;
  int limit = 10;
  final controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller.addListener(() {
    //   if (controller.position.maxScrollExtent == controller.offset) {
    //     context
    //         .read<PaginationProductBloc>()
    //         .add(GetPaginationProductEvent(limit: limit + 10, offset: offset));
    //   }
    // });
    // context.read<ProductsBloc>().add(GetProductsEvent());
    context
        .read<PaginationProductBloc>()
        .add(GetPaginationProductEvent(limit: limit, offset: offset));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.addListener(() {
        if (controller.position.maxScrollExtent == controller.offset) {
          context.read<PaginationProductBloc>().add(GetPaginationProductEvent(
              limit: limit += 10, offset: offset += 10));
        }
      });
    });

    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   controller.addListener(() {
    //     if (controller.position.maxScrollExtent == controller.offset) {
    //       final paginationProductBloc = context.read<PaginationProductBloc>();

    //       // Jika sudah mencapai data terakhir, berhenti memuat lebih banyak data
    //       // if (!paginationProductBloc.state.) {
    //       //   return;
    //       // }

    //       paginationProductBloc.add(
    //         GetPaginationProductEvent(limit: limit += 10, offset: offset),
    //       );
    //     }
    //   });
    // });
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const AddProductPage();
                },
              ),
            );
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Home Page'),
          elevation: 5,
          actions: [
            InkWell(
                onTap: () async {
                  await LocalDatasource().removeToken();
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
                child: const Icon(Icons.logout)),
            const SizedBox(
              width: 16,
            )
          ],
        ),
        body: BlocBuilder<PaginationProductBloc, PaginationProductState>(
            builder: (context, state) {
            return ListView.builder(
              controller: controller,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Card(
                    child: ListTile(
                      // leading: Text(
                      //   (index + 1).toString(),
                      // ),
                      title: Text(
                        state.data.reversed.toList()[index].title ?? '-',
                      ),
                      subtitle: Text(
                        state.data.reversed.toList()[index].price.toString(),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return EditProductPage(
                                  product: state.data.reversed.toList()[index],
                                );
                              },
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              itemCount: state.data.length,
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        })
        // body: BlocBuilder<ProductsBloc, ProductsState>(
        //   builder: (context, state) {
        //     if (state is ProductsLoaded) {
        //       return ListView.builder(
        //         itemBuilder: ((context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.symmetric(
        //               horizontal: 16,
        //             ),
        //             child: Card(
        //               child: ListTile(
        //                 leading: Text(
        //                   (index + 1).toString(),
        //                 ),
        //                 title: Text(
        //                   state.data.reversed.toList()[index].title ?? '-',
        //                 ),
        //                 subtitle: Text(
        //                   state.data.reversed.toList()[index].price.toString(),
        //                 ),
        //                 trailing: InkWell(
        //                   onTap: () {
        //                     Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                         builder: (context) {
        //                           return EditProductPage(
        //                             product: state.data.reversed.toList()[index],
        //                           );
        //                         },
        //                       ),
        //                     );
        //                   },
        //                   child: const Icon(
        //                     Icons.edit,
        //                     color: Colors.amber,
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           );
        //         }),
        //         itemCount: state.data.length,
        //       );
        //     }
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // ),
        );
  }
}
