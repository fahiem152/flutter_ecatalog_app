import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/pagination_product/pagination_product_bloc.dart';
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
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PaginationProductBloc>().add(GetPaginationProductEvent());
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<PaginationProductBloc>().add(NextPaginationProductEvent());
      }
    });
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
          if (state is PaginationProductLoaded) {
            debugPrint('totaldata : ${state.data.length}');
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                controller: scrollController,
                // reverse: true,
                itemBuilder: (context, index) {
                  if (state.isNext && index == state.data.length) {
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
                    child: ListTile(
                      leading: Text(
                        (index + 1).toString(),
                      ),
                      title: Text(
                          state.data.reversed.toList()[index].title ?? '-'),
                      subtitle: Text('${state.data[index].price}\$'),
                      trailing: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditProductPage(
                                    product:
                                        state.data.reversed.toList()[index],
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
                  );
                },
                itemCount:
                    state.isNext ? state.data.length + 1 : state.data.length,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
