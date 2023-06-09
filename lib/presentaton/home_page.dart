import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecatalog/bloc/products/products_bloc.dart';
import 'package:flutter_ecatalog/presentaton/add_product_page.dart';

import '../data/datasources/local_datasource.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsBloc>().add(GetProductsEvent());
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
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoaded) {
              return ListView.builder(
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          state.data.reversed.toList()[index].title ?? '-',
                        ),
                        subtitle: Text(
                          state.data.reversed.toList()[index].price.toString(),
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
          },
        ));
  }
}
