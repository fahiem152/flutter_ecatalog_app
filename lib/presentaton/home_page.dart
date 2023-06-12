import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/pagination_product/pagination_product_bloc.dart';
import 'package:flutter_ecatalog/presentaton/add_product_page.dart';
import 'package:flutter_ecatalog/presentaton/edit_product_page.dart';

import '../data/datasources/local_datasource.dart';
import '../data/models/responses/product_response_model.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int offset = 0;
  int limit = 10;
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  List<ProductResponseModel> products = [];

  void scrollPagination(context) {
    scrollController.addListener(() {
      debugPrint("offset: $offset");
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        BlocProvider.of<PaginationProductBloc>(context)
            .add(GetPaginationProductEvent(limit: limit, offset: offset));
      }
    });
  }

  @override
  void initState() {
    scrollPagination(context);
    super.initState();
    context
        .read<PaginationProductBloc>()
        .add(GetPaginationProductEvent(limit: limit, offset: offset));
  }

  @override
  Widget build(BuildContext context) {
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
          if (state is PaginationProductLoading) {
            products = state.data;
            isLoading = true;
          }
          if (state is PaginationProductLoaded) {
            products = state.data;
            isLoading = false;
            limit = limit + 10;
            offset = limit;
          }
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Card(
                          child: ListTile(
                            leading: Text(
                              (index + 1).toString(),
                            ),
                            title: Text(
                              products.toList()[index].title ?? '-',
                            ),
                            subtitle: Text(
                              products.reversed
                                  .toList()[index]
                                  .price
                                  .toString(),
                            ),
                            trailing: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return EditProductPage(
                                        product:
                                            products.reversed.toList()[index],
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
                    itemCount: products.length,
                  ),
                ),
                isLoading
                    ? const Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 4,
                          ),
                          Text('Loading...')
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          );
        }

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
            ));
  }
}
