import 'package:flutter/material.dart';
import 'package:dependencies/dependencies.dart';

import '../../bloc/products_cubit/productsc_cubit.dart';
import 'add_product_page.dart';
import 'detail_product_page.dart';
import 'edit_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ProductscCubit>().getProducts();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<ProductscCubit>().nextGetProducts();
      }
    });
    // context.read<PaginationProductBloc>().add(GetPaginationProductEvent());
    // scrollController.addListener(() {
    //   if (scrollController.position.maxScrollExtent ==
    //       scrollController.offset) {
    //     context.read<PaginationProductBloc>().add(NextPaginationProductEvent());
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) {
    //           return const AddProductPage();
    //         },
    //       ),
    //     );
    //   },
    //   child: const Icon(
    //     Icons.add,
    //   ),
    // ),
    // appBar: AppBar(
    //   automaticallyImplyLeading: false,
    //   title: const Text('Home Page'),
    //   elevation: 5,
    //   actions: [
    //     InkWell(
    //         onTap: () async {
    //           await LocalDatasource().removeToken();
    //           Navigator.push(context, MaterialPageRoute(builder: (context) {
    //             return const LoginPage();
    //           }));
    //         },
    //         child: const Icon(Icons.logout)),
    //     const SizedBox(
    //       width: 16,
    //     )
    //   ],
    // ),
    // body:
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(
            16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Home Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddProductPage();
                      },
                    ),
                  );
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xff03dac6),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<ProductscCubit, ProductscState>(
            builder: (context, state) {
              return state.maybeWhen(loaded: (data, offset, limit, isNext) {
                debugPrint('totaldata : ${data.length}');
                debugPrint('Offset : $offset');
                debugPrint('Limit : $limit');
                debugPrint('isnext : $isNext');
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ScrollConfiguration(
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
                      controller: scrollController,
                      // reverse: true,
                      itemBuilder: (context, index) {
                        if (isNext && index == data.length) {
                          return const Column(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Center(
                                child: Text('Load More'),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                            ],
                          );
                        }
                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailProductPage(
                                  product: data.reversed.toList()[index],
                                );
                              }));
                            },
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.network(
                                    data.reversed.toList()[index].images[0],
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover),
                              ),
                              title: Text(data.reversed.toList()[index].title),
                              subtitle: Text(
                                  '${data.reversed.toList()[index].price}\$'),
                              trailing: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return EditProductPage(
                                            product:
                                                data.reversed.toList()[index],
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.amber,
                                  )),
                            ),
                          ),
                        );
                      },
                      itemCount: isNext ? data.length + 1 : data.length,
                    ),
                  ),
                );
              }, orElse: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              });
              // if (state is PaginationProductLoaded) {
              //   debugPrint('totaldata : ${state.data.length}');
              //   return Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //     child: ListView.builder(
              //       controller: scrollController,
              //       // reverse: true,
              //       itemBuilder: (context, index) {
              //         if (state.isNext && index == state.data.length) {
              //           return const Column(
              //             children: [
              //               SizedBox(
              //                 height: 12,
              //               ),
              //               Center(
              //                 child: CircularProgressIndicator(),
              //               ),
              //               SizedBox(
              //                 height: 4,
              //               ),
              //               Center(
              //                 child: Text('Load More'),
              //               ),
              //               SizedBox(
              //                 height: 12,
              //               ),
              //             ],
              //           );
              //         }
              //         return Card(
              //           child: ListTile(
              //             leading: Text(
              //               (index + 1).toString(),
              //             ),
              //             title: Text(
              //                 state.data.reversed.toList()[index].title ?? '-'),
              //             subtitle: Text('${state.data[index].price}\$'),
              //             trailing: InkWell(
              //                 onTap: () {
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) {
              //                         return EditProductPage(
              //                           product:
              //                               state.data.reversed.toList()[index],
              //                         );
              //                       },
              //                     ),
              //                   );
              //                 },
              //                 child: const Icon(
              //                   Icons.edit,
              //                   color: Colors.amber,
              //                 )),
              //           ),
              //         );
              //       },
              //       itemCount:
              //           state.isNext ? state.data.length + 1 : state.data.length,
              //     ),
              //   );
              // }
              // return const Center(
              //   child: CircularProgressIndicator(),
              // );
            },
          ),
        ),
      ],
    );
    // BlocBuilder<PaginationProductBloc, PaginationProductState>(
    //   builder: (context, state) {
    //     if (state is PaginationProductLoaded) {
    //       debugPrint('totaldata : ${state.data.length}');
    //       return Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //         child: ListView.builder(
    //           controller: scrollController,
    //           // reverse: true,
    //           itemBuilder: (context, index) {
    //             if (state.isNext && index == state.data.length) {
    //               return const Column(
    //                 children: [
    //                   SizedBox(
    //                     height: 12,
    //                   ),
    //                   Center(
    //                     child: CircularProgressIndicator(),
    //                   ),
    //                   SizedBox(
    //                     height: 4,
    //                   ),
    //                   Center(
    //                     child: Text('Load More'),
    //                   ),
    //                   SizedBox(
    //                     height: 12,
    //                   ),
    //                 ],
    //               );
    //             }
    //             return Card(
    //               child: ListTile(
    //                 leading: Text(
    //                   (index + 1).toString(),
    //                 ),
    //                 title: Text(
    //                     state.data.reversed.toList()[index].title ?? '-'),
    //                 subtitle: Text('${state.data[index].price}\$'),
    //                 trailing: InkWell(
    //                     onTap: () {
    //                       Navigator.push(
    //                         context,
    //                         MaterialPageRoute(
    //                           builder: (context) {
    //                             return EditProductPage(
    //                               product:
    //                                   state.data.reversed.toList()[index],
    //                             );
    //                           },
    //                         ),
    //                       );
    //                     },
    //                     child: const Icon(
    //                       Icons.edit,
    //                       color: Colors.amber,
    //                     )),
    //               ),
    //             );
    //           },
    //           itemCount:
    //               state.isNext ? state.data.length + 1 : state.data.length,
    //         ),
    //       );
    //     }
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // ),
  }
}
